part of 'sign_in_cubit.dart';

class SignInState extends Equatable {

  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}
class SignInLoadingState extends SignInState {}
class SignInSuccessState extends SignInState {}
class SignInFailedState extends SignInState {
  const SignInFailedState(this.message);
  final String message;
}
