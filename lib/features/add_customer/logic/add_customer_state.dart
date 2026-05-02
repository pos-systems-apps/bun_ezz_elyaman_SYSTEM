abstract class AddCustomersState {}

class InitialState extends AddCustomersState {}



class OnAddCustomerLoadingState extends AddCustomersState {}
class OnAddCustomerSuccessState extends AddCustomersState {}
class OnAddCustomerErrorState extends AddCustomersState {}
class OnAddCustomerCatchErrorState extends AddCustomersState {}
