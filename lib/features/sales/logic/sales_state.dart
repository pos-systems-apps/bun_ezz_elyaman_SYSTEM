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


class OnChangeSelectedProductState extends SalesState {}


