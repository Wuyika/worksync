import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worklin/models/user_model.dart';
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
      final user = UserModel(
        email: email,
        firstName: "Wuyika",
        lastName: "Serge Kevin",
        gender: "M",
        placeOfBirth: "",
        dateOfBirth: DateTime(2000, 08, 27),
        phoneNumber: "+237 653 548 653",
        residentCity: "Buea",
        position: "Flutter Mobile Engineer",
      );
      // if (user != null) {
        AppData.updateCurrentUser(user: user);
        emit(SignInSuccessState());
      // } else {
      //   SignInInitialState();
      // }
    } catch (error) {
      emit(
        SignInFailedState(error.toString()),
      );
    }
  }
}
