abstract class AddCustomersState {}

class InitialState extends AddCustomersState {}
class OnChangeSelectedImageState extends AddCustomersState {}

class OnGetCategoriesAndRegionsLoadingState extends AddCustomersState {}
class OnGetCategoriesAndRegionsSuccessState extends AddCustomersState {}
class OnGetCategoriesAndRegionsErrorState extends AddCustomersState {}
class OnGetCategoriesAndRegionsCatchErrorState extends AddCustomersState {}

class OnChangeSelectedCategoryState extends AddCustomersState {}
class OnChangeSelectedRegionState extends AddCustomersState {}


class OnAddCustomerLoadingState extends AddCustomersState {}
class OnAddCustomerSuccessState extends AddCustomersState {}
class OnAddCustomerErrorState extends AddCustomersState {}
class OnAddCustomerCatchErrorState extends AddCustomersState {}
