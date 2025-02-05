abstract class LoginState {}

class InitialState extends LoginState {}

class OnLoginLoadingState extends LoginState {}

class OnLoginSuccessState extends LoginState {}

class OnLoginErrorState extends LoginState {
  final String error;

  OnLoginErrorState({required this.error});
}

class OnLoginCatchErrorState extends LoginState {
  final String error;

  OnLoginCatchErrorState({required this.error});
}
