abstract class MyRequestsState {}

class InitialState extends MyRequestsState {}

class OnGetMyRequestsLoadingState extends MyRequestsState {}
class OnGetMyRequestsSuccessState extends MyRequestsState {}
class OnGetMyRequestsErrorState extends MyRequestsState {}
class OnGetMyRequestsCatchErrorState extends MyRequestsState {}
