
import 'package:flutter_bloc/flutter_bloc.dart';

enum AttendanceSummaryState {
  checkIn,
  checkOut,
  endOfDay,
}

class AttendanceSummaryCubit extends Cubit<AttendanceSummaryState> {
  AttendanceSummaryCubit() : super(AttendanceSummaryState.checkIn);
  void updateIndex(AttendanceSummaryState state) => emit(state);
}

