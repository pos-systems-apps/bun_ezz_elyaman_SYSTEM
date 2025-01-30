abstract class LoginState {}

class InitialState extends LoginState {}

class OnGetCountryLoadingState extends LoginState {}
class OnGetCountrySuccessState extends LoginState {}
class OnGetCountryErrorState extends LoginState {}
class OnGetCountryCatchErrorState extends LoginState {}

class OnChangeSelectedCountryState extends LoginState {}
class OnChangeReminderBoxState extends LoginState {}

class OnLoginLoadingState extends LoginState {}
class OnLoginSuccessState extends LoginState {}
class OnLoginErrorState extends LoginState {}
class OnLoginCatchErrorState extends LoginState {}
