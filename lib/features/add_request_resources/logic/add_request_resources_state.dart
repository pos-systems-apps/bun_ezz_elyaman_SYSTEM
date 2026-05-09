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
class OnAddResourcesLoadingState extends AddRequestResourcesState {}

class OnAddResourcesSuccessState extends AddRequestResourcesState {

  OnAddResourcesSuccessState();
}

class OnAddResourcesErrorState extends AddRequestResourcesState {
  String message;

  OnAddResourcesErrorState({required this.message});
}

class OnAddResourcesCatchErrorState extends AddRequestResourcesState {
  String message;

  OnAddResourcesCatchErrorState({required this.message});
}
