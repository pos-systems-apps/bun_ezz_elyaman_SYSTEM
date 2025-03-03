abstract class LeaveRequestsState {}

class InitialState extends LeaveRequestsState {}

// class OnChangeOrderTypeSelectState extends LeaveRequestsState {}

class OnGetMyRequestsLoadingState extends LeaveRequestsState {}
class OnGetMyRequestsSuccessState extends LeaveRequestsState {}
class OnGetMyRequestsErrorState extends LeaveRequestsState {}
class OnGetMyRequestsCatchErrorState extends LeaveRequestsState {}
