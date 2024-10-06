import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:worklin/models/company_branch_model.dart';
import 'package:worklin/services/api_service.dart';
import 'package:worklin/services/location_service.dart';
import 'package:worklin/utils/app_alert.dart';
import 'package:worklin/utils/globals.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/my_pref.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  String? duration;
  TimeOfDay? checkInTime;
  TimeOfDay? checkOutTime;
  LatLng? myCurrentPosition;
  LatLng? companyPosition;
  CompanyBranchModel? companyBranch;
  final LocationService locationService = LocationService();
  final ApiService apiService = ApiService();
  double? distanceC;
  int timeCheckedOut = 0;

  AttendanceCubit() : super(AttendanceCheckInState());

  Future<bool?> requestLocationPermission() async {
    try {
      final bool? permission = await locationService.requestPermission();
      if (permission == true) {
        if (await locationService.isServiceEnabled()) {
          return true;
        } else {
          AppAlerts.showInfoSnackBar("Enable location permission to check in");
          return null;
        }
      }
    } catch (error) {
      emit(AttendanceErrorState(error.toString()));
    }
    return null;
  }

  Future<bool> getLocation() async {
    try {
      final position = await locationService.determineCurrentPosition();
      if (position != null) {
        myCurrentPosition = position;
        return true;
      }
    } catch (error) {
      emit(AttendanceErrorState(error.toString()));
    }
    return false;
  }

  Future<bool> fetchCompanyBranch({required int companyId}) async {
    try {
      final branch = await apiService.getCompanyInfo(branchId: companyId);
      if (branch?.latitude != null && branch?.longitude != null) {
        companyBranch = branch;
        companyPosition = LatLng(
          double.parse(branch!.latitude!),
          double.parse(branch.longitude!),
        );
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> calculateDistance({bool forCheckIn = true}) async {
    if (myCurrentPosition != null && companyPosition != null) {
      final distance = await locationService.calculateCoordinateDistance(
        startCoordinate: myCurrentPosition!,
        endCoordinate: companyPosition!,
      );
      if (distance != null) {
        final checkedIn = await apiService.checkInEmployee(
          siteId: "${companyBranch?.id ?? 0}",
          distance: (distance/1000).toStringAsFixed(2),
          unitDistance: "KM",
        );
        if (checkedIn == true) {
          MyPref.saveLastDay(date: DateTime.now());
          if (forCheckIn == true) {
            checkInTime = TimeOfDay.now();
            MyPref.saveLastCheckInTime(time: checkInTime!);
            MyPref.saveLastType(type: clockIn);
            checkOutTime = null;
            emit(AttendanceCheckOutState());
            return true;
          } else {
            checkOutTime = TimeOfDay.now();
            MyPref.saveLastCheckOutTime(time: checkOutTime!);
            MyPref.saveLastType(type: clockOut);
            timeCheckedOut = timeCheckedOut + 1;
            MyPref.saveTimesCheckOut(number: timeCheckedOut);
            duration = formatDuration(checkInTime!, checkOutTime!);
            if (timeCheckedOut < 1) {
              emit(AttendanceCheckInState());
            } else {
              emit(AttendanceEndDayState());
            }

            return true;
          }
        }
      }
    }
    return false;
  }

  void initCheck() {
    final now = DateTime.now();
    final lastSaveDay = MyPref.getLastSaveDay();
    if (lastSaveDay != null){
      if (now.day == lastSaveDay.day) {
        final type = MyPref.getLastType();
        if (type == clockIn) {
          final time = MyPref.getLastCheckInTime();
          checkInTime = time;
          emit(AttendanceCheckOutState());
        } else if (type == clockOut) {
          final timeIn = MyPref.getLastCheckInTime();
          checkInTime = timeIn;
          final timeOut = MyPref.getLastCheckOutTime();
          checkOutTime = timeOut;
        }
        final times = MyPref.getTimesCheckOut();
        timeCheckedOut = times;
        if (times >= 1) {
          emit(AttendanceEndDayState());
        }
      }
    }
  }

  void emitCheckOut(){
    emit(AttendanceCheckOutState());
  }

  void emitEnd(){
    emit(AttendanceEndDayState());
  }
}
