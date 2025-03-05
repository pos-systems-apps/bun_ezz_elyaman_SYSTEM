abstract class SalaryState {}

class InitialState extends SalaryState {}

// class OnChangeOrderTypeSelectState extends LeaveRequestsState {}

class OnGetSalaryLoadingState extends SalaryState {}
class OnGetSalarySuccessState extends SalaryState {}
class OnGetSalaryErrorState extends SalaryState {}
class OnGetSalaryCatchErrorState extends SalaryState {}
