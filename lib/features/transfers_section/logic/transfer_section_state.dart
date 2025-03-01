abstract class TransferSectionState {}

class InitialState extends TransferSectionState {}
class OnChangeSelectedImageState extends TransferSectionState {}

class OnGetUsersLoadingState extends TransferSectionState {}

class OnGetUsersErrorState extends TransferSectionState {}

// class OnGetUsersSuccessState extends CreateVisitState {}
//
// class OnGetUsersCatchErrorState extends CreateVisitState {}
//
// class OnSelectUserState extends CreateVisitState {}
//
// class OnCreateVisitLoadingState extends CreateVisitState {}
//
// class OnCreateVisitSuccessState extends CreateVisitState {}
//
// class OnCreateVisitErrorState extends CreateVisitState {}
//
// class OnCreateVisitCatchErrorState extends CreateVisitState {
//   String error;
//
//   OnCreateVisitCatchErrorState({required this.error});
// }
