abstract class AddRequestResourcesState {}

class InitialState extends AddRequestResourcesState {}

class OnChangeResourcesTypeSelectState extends AddRequestResourcesState {}


class OnGetCategoryLoadingState extends AddRequestResourcesState {}
class OnGetCategorySuccessState extends AddRequestResourcesState {}
class OnGetCategoryErrorState extends AddRequestResourcesState {}
class OnGetCategoryCatchErrorState extends AddRequestResourcesState {}
class OnChangeSelectedCategoryState extends AddRequestResourcesState {}

class OnGetCategoryProductsLoadingState extends AddRequestResourcesState {}
class OnGetCategoryProductsSuccessState extends AddRequestResourcesState {}
class OnGetCategoryProductsErrorState extends AddRequestResourcesState {}
class OnGetCategoryProductsCatchErrorState extends AddRequestResourcesState {}


class OnGetSearchProductsLoadingState extends AddRequestResourcesState {}
class OnGetSearchProductsSuccessState extends AddRequestResourcesState {}
class OnGetSearchProductsErrorState extends AddRequestResourcesState {}
class OnGetSearchProductsCatchErrorState extends AddRequestResourcesState {}



class OnChangeSelectedProductState extends AddRequestResourcesState {}
class OnChangeSelectedImageState extends AddRequestResourcesState {}
class OnChangePaySelectState extends AddRequestResourcesState {}

//
//
// class OnSelectUserState extends SalesState {}
// class OnGetUsersLoadingState extends SalesState {}
// class OnGetUsersErrorState extends SalesState {}
// class OnGetUsersCatchErrorState extends SalesState {}
// class OnGetUsersSuccessState extends SalesState {}
//
//
// class OnCreateOrderLoadingState extends SalesState {}
// class OnCreateOrderSuccessState extends SalesState {
//   int orderId;
//
//   OnCreateOrderSuccessState({required this.orderId});
// }
// class OnCreateOrderErrorState extends SalesState {
//   String message;
//
//   OnCreateOrderErrorState({required this.message});
// }
// class OnCreateOrderCatchErrorState extends SalesState {
//   String message;
//
//   OnCreateOrderCatchErrorState({required this.message});
// }
