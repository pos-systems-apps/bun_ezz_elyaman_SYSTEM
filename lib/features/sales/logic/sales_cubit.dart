import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import '../data/repo/sales_repo.dart';
import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepo _salesRepo;

  SalesCubit(this._salesRepo) : super(InitialState());

  static List<OrderTypeClass> orderTypes = AppConstant.orderTypes;

  OrderTypeClass selectedOrderType = orderTypes[0];

  changeSelectedBillType(OrderTypeClass value) {
    selectedOrderType = value;
    getCategoriesFromHere();
    changeSelectedCategory(null);
    emit(OnChangeOrderTypeSelectState());
  }

  ///categories

  int categoriesCurrentPage = 1;
  int categoriesLastPage = 10000;
  ScrollController categoriesScrollController = ScrollController();

  getCategoriesFromHere() {
    categories = [];
    categoriesCurrentPage = 1;
    categoriesLastPage = 10000;
    scrollListenerGetCategories();
    getCategories();
  }

  scrollListenerGetCategories() {
    categoriesScrollController.addListener(() {
      if (categoriesCurrentPage < categoriesLastPage) {
        if (categoriesScrollController.position.pixels ==
            categoriesScrollController.position.maxScrollExtent) {
          categoriesCurrentPage++;
          getCategories();
        }
      }
    });
  }

  List<Category> categories = [];

  getCategories() {
    emit(OnGetCategoryLoadingState());
    _salesRepo.getCategories(categoriesCurrentPage).then((value) {
      value.fold((l) {
        emit(OnGetCategoryErrorState());
      }, (r) {
        categoriesCurrentPage = r.categoryPagination.currentPage;
        categoriesLastPage = r.categoryPagination.lastPage;
        categories.addAll(r.categoryPagination.categories);
        if (r.categoryPagination.categories.isNotEmpty &&
            selectedCategory == null) {
          changeSelectedCategory(r.categoryPagination.categories[0]);
          getCategoryProductsFromHere(r.categoryPagination.categories[0].id);
        }
        emit(OnGetCategorySuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoryCatchErrorState());
    });
  }

  Category? selectedCategory;

  ///call products
  changeSelectedCategory(Category? value) {
    selectedCategory = value;
    if (value != null) {
      getCategoryProductsFromHere(value.id);
    }

    emit(OnChangeSelectedCategoryState());
  }

  ///products
  List<Product> products = [];

  int categoryProductsCurrentPage = 1;
  int categoryProductsLastPage = 10000;
  ScrollController categoryProductsScrollController = ScrollController();

  getCategoryProductsFromHere(int categoryID) {
    products = [];
    categoryProductsCurrentPage = 1;
    categoryProductsLastPage = 10000;
    scrollListenerGetCategoryProducts(categoryID);
    getCategoryProducts(categoryID);
  }

  scrollListenerGetCategoryProducts(int categoryID) {
    categoryProductsScrollController.addListener(() {
      if (categoryProductsCurrentPage < categoryProductsLastPage) {
        if (categoryProductsScrollController.position.pixels ==
            categoryProductsScrollController.position.maxScrollExtent) {
          categoryProductsCurrentPage++;
          getCategoryProducts(categoryID);
        }
      }
    });
  }

  getCategoryProducts(int categoryID) {
    emit(OnGetCategoryProductsLoadingState());
    _salesRepo
        .getCategoryProducts(
            categoryID, selectedOrderType.id, categoryProductsCurrentPage)
        .then((value) {
      value.fold((l) {
        emit(OnGetCategoryProductsErrorState());
      }, (r) {
        categoryProductsCurrentPage = r.currentPage;
        categoryProductsLastPage = r.lastPage;
        products.addAll(r.categoryProducts);
        emit(OnGetCategoryProductsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoryProductsCatchErrorState());
    });
  }

  ///search product
  ///
  TextEditingController searchProductController = TextEditingController();

  List<Product> searchProducts = [];

  int searchProductsCurrentPage = 1;
  int searchProductsLastPage = 10000;
  ScrollController searchProductsScrollController = ScrollController();

  getSearchProductsFromHere() {
    searchProducts = [];
    searchProductsCurrentPage = 1;
    searchProductsLastPage = 10000;
    scrollListenerGetSearchProducts();
    getSearchProducts();
  }

  scrollListenerGetSearchProducts() {
    searchProductsScrollController.addListener(() {
      if (searchProductsCurrentPage < searchProductsLastPage) {
        if (searchProductsScrollController.position.pixels ==
            searchProductsScrollController.position.maxScrollExtent) {
          searchProductsCurrentPage++;
          getSearchProducts();
        }
      }
    });
  }

  getSearchProducts() {
    emit(OnGetSearchProductsLoadingState());
    _salesRepo
        .getSearchProducts(searchProductController.text, selectedOrderType.id,
            searchProductsCurrentPage)
        .then((value) {
      value.fold((l) {
        emit(OnGetSearchProductsErrorState());
      }, (r) {
        searchProductsCurrentPage = r.currentPage;
        searchProductsLastPage = r.lastPage;
        searchProducts.addAll(r.categoryProducts);
        emit(OnGetSearchProductsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetSearchProductsCatchErrorState());
    });
  }

  ///select product
  List<SelectedProductClass> selectedProducts = [];

  addProductToSelectedProducts(SelectedProductClass value) {
    selectedProducts.add(value);
    emit(OnChangeSelectedProductState());
  }

  // editInProductFromSelectedProducts(SelectedProductClass value) {
  //   int index = selectedProducts.indexOf(value);
  //   if (index != -1) {
  //     selectedProducts[index] = value;
  //     print(selectedProducts[index].product.nameAr);
  //     print(selectedProducts[index].maxValueCounter);
  //     print(selectedProducts[index].minValueCounter);
  //   }
  //
  //   emit(OnChangeSelectedProductState());
  // }

  removeProductFromSelectedProducts(SelectedProductClass value) {
    selectedProducts.removeWhere(
        (item) => item.product.productCode == value.product.productCode);
    emit(OnChangeSelectedProductState());
  }

  bool selectedProductsIsContainProduct(SelectedProductClass value) {
    return selectedProducts
        .any((item) => item.product.productCode == value.product.productCode);
  }

  TextEditingController searchUserController = TextEditingController();

  ///

  static SalesCubit get(context) => BlocProvider.of(context);
}
