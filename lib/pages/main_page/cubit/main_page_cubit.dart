import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MainPageState {
  dashboard,
  attendance,
  reports,
  messages,
  leaves,
}

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState.dashboard);
  void updateIndex(MainPageState state) => emit(state);
}
