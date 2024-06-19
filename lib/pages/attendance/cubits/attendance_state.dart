part of 'attendance_cubit.dart';

class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

final class AttendanceCheckInState extends AttendanceState {}
final class AttendanceCheckOutState extends AttendanceState {}
final class AttendanceEndDayState extends AttendanceState {}
final class AttendanceErrorState extends AttendanceState {
  const AttendanceErrorState(this.error);
  final String error;
}
