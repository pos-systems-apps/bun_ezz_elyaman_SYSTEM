abstract class AllCoursesState {}

class InitialState extends AllCoursesState {}
class OnChangeSelectedImageState extends AllCoursesState {}

class OnGetUsersLoadingState extends AllCoursesState {}

class OnGetUsersErrorState extends AllCoursesState {}

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
