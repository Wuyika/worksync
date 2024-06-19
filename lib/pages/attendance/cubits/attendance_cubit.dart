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

  AttendanceCubit() : super(AttendanceCheckInState());

  Future<void> checkIn() async {
    // emit(AttendanceCheckOutState());
  }

  Future<void> checkOut() async {
    emit(AttendanceEndDayState());
    // locationService.requestPermission();
  }

  Future<bool?> requestLocationPermission() async {
    final bool? permission = await locationService.requestPermission();
    if (permission == true) {
      if (await locationService.isServiceEnabled()) {
        return true;
      } else {
        AppAlerts.showInfoSnackBar("Enable location permission to check in");
        return null;
      }
    }
    return null;
  }

  Future<bool> getLocation() async {
    final position = await locationService.determineCurrentPosition();
    if (position != null) {
      myCurrentPosition = position;
      return true;
    }
    return false;
  }

  Future<bool> fetchCompanyBranch() async {
    final companyBranch = await apiService.getCompanyInfo(branchId: 1);
    if (companyBranch?.latitude != null && companyBranch?.longitude != null) {
      companyPosition = LatLng(
        double.parse(companyBranch!.latitude!),
        double.parse(companyBranch.longitude!),
      );
      return true;
    }
    return false;
  }

  Future<bool> calculateDistance() async {
    if (myCurrentPosition != null && companyPosition != null) {
      final distance = locationService.calculateCoordinateDistance(
        startCoordinate: myCurrentPosition!,
        endCoordinate: companyPosition!,
      );
      final checkedIn = await apiService.checkInEmployee(siteId: "1", distance: "3.42", unitDistance: "M");
      if(checkedIn == true){
        checkInTime = TimeOfDay.now();
        emit(AttendanceCheckOutState());
        return true;
      }
      else{
        checkInTime = TimeOfDay.now();
        emit(AttendanceCheckOutState());
        return false;
      }
    }

    return false;
  }
}
