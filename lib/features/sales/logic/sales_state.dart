abstract class SalesState {}

class InitialState extends SalesState {}

class OnChangeOrderTypeSelectState extends SalesState {}



class OnGetCategoryLoadingState extends SalesState {}
class OnGetCategorySuccessState extends SalesState {}
class OnGetCategoryErrorState extends SalesState {}
class OnGetCategoryCatchErrorState extends SalesState {}
class OnChangeSelectedCategoryState extends SalesState {}

class OnGetCategoryProductsLoadingState extends SalesState {}
class OnGetCategoryProductsSuccessState extends SalesState {}
class OnGetCategoryProductsErrorState extends SalesState {}
class OnGetCategoryProductsCatchErrorState extends SalesState {}


class OnGetSearchProductsLoadingState extends SalesState {}
class OnGetSearchProductsSuccessState extends SalesState {}
class OnGetSearchProductsErrorState extends SalesState {}
class OnGetSearchProductsCatchErrorState extends SalesState {}



class OnChangeSelectedProductState extends SalesState {}
class OnChangeSelectedImageState extends SalesState {}
class OnChangePaySelectState extends SalesState {}



class OnSelectUserState extends SalesState {}
class OnGetUsersLoadingState extends SalesState {}
class OnGetUsersErrorState extends SalesState {}
class OnGetUsersCatchErrorState extends SalesState {}
class OnGetUsersSuccessState extends SalesState {}


class OnCreateOrderLoadingState extends SalesState {}
class OnCreateOrderSuccessState extends SalesState {

}
class OnCreateOrderErrorState extends SalesState {
  String message;

  OnCreateOrderErrorState({required this.message});
}
class OnCreateOrderCatchErrorState extends SalesState {
  String message;

  OnCreateOrderCatchErrorState({required this.message});
}
