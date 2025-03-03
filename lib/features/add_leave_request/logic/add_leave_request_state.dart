abstract class AddLeaveRequestState {}

class InitialState extends AddLeaveRequestState {}
class OnChangeDateState extends AddLeaveRequestState {}

class OnAddLeaveRequestLoadingState extends AddLeaveRequestState {}

class OnAddLeaveRequestSuccessState extends AddLeaveRequestState {}

class OnAddLeaveRequestErrorState extends AddLeaveRequestState {}

class OnAddLeaveRequestCatchErrorState extends AddLeaveRequestState {
  String error;

  OnAddLeaveRequestCatchErrorState({required this.error});
}
