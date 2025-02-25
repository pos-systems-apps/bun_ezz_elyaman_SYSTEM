abstract class CreateVisitState {}

class InitialState extends CreateVisitState {}

class OnGetUsersLoadingState extends CreateVisitState {}

class OnGetUsersErrorState extends CreateVisitState {}

class OnGetUsersSuccessState extends CreateVisitState {}

class OnGetUsersCatchErrorState extends CreateVisitState {}

class OnSelectUserState extends CreateVisitState {}

class OnCreateVisitLoadingState extends CreateVisitState {}

class OnCreateVisitSuccessState extends CreateVisitState {}

class OnCreateVisitErrorState extends CreateVisitState {}

class OnCreateVisitCatchErrorState extends CreateVisitState {
  String error;

  OnCreateVisitCatchErrorState({required this.error});
}
