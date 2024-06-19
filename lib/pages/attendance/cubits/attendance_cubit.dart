import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:worklin/models/company_branch_model.dart';
import 'package:worklin/services/api_service.dart';
import 'package:worklin/services/location_service.dart';
import 'package:worklin/utils/app_alert.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  TimeOfDay? checkInTime;
  TimeOfDay? checkOutTime;
  LatLng? myCurrentPosition;
  LatLng? companyPosition;
  CompanyBranchModel? companyBranch;
  final LocationService locationService = LocationService();
  final ApiService apiService = ApiService();
  double? distanceC;

  AttendanceCubit() : super(AttendanceCheckInState());

  Future<void> checkIn() async {
    // emit(AttendanceCheckOutState());
  }

  Future<void> checkOut() async {
    checkOutTime = TimeOfDay.now();
    emit(AttendanceEndDayState());
    // locationService.requestPermission();
  }

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
        print(myCurrentPosition);
        return true;
      }
    } catch (error) {
      emit(AttendanceErrorState(error.toString()));
    }
    return false;
  }

  Future<bool> fetchCompanyBranch({required int companyId}) async {
    try {
      final branch = await apiService.getCompanyInfo(branchId: 2);
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
      final checkedIn = await apiService.checkInEmployee(
        siteId: "${companyBranch?.id ?? 0}",
        distance: "$distance",
        unitDistance: "M",
      );
      if (checkedIn == true) {
        if(forCheckIn == true){
          checkInTime = TimeOfDay.now();
          emit(AttendanceCheckOutState());
          return true;
        } else {
          checkOutTime = TimeOfDay.now();
          emit(AttendanceEndDayState());
          return true;
        }
      }
    }
    return false;
  }
}
