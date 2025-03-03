abstract class AddMyRequestState {}

class InitialState extends AddMyRequestState {}

class OnAddMyRequestLoadingState extends AddMyRequestState {}

class OnAddMyRequestSuccessState extends AddMyRequestState {}

class OnAddMyRequestErrorState extends AddMyRequestState {}

class OnAddMyRequestCatchErrorState extends AddMyRequestState {
  String error;

  OnAddMyRequestCatchErrorState({required this.error});
}
