abstract class CollectionsState {}

class InitialState extends CollectionsState {}

class OnLoginLoadingState extends CollectionsState {}

class OnLoginSuccessState extends CollectionsState {}

class OnLoginErrorState extends CollectionsState {
  final String error;

  OnLoginErrorState({required this.error});
}

class OnLoginCatchErrorState extends CollectionsState {
  final String error;

  OnLoginCatchErrorState({required this.error});
}
