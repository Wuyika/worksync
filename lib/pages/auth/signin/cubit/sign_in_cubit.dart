import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worklin/providers/app_data.dart';
import 'package:worklin/services/api_service.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());
  final ApiService apiService = ApiService();

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(SignInLoadingState());
      final user = await apiService.signInUser(
        email: email,
        password: password,
      );
      if (user != null) {
        AppData.updateCurrentUser(user: user);
      }
      emit(SignInSuccessState());
    } catch (error) {
      emit(
        SignInFailedState(error.toString()),
      );
    }
  }
}
