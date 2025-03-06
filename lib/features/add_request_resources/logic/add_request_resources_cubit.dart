import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/add_request_resources/data/entities/resource_selected_product_class.dart';
import 'package:pos_system/features/add_request_resources/data/entities/resource_type_class.dart';
import 'package:pos_system/features/add_request_resources/data/models/create_request_resources_request.dart';
import 'package:pos_system/features/add_request_resources/data/repo/add_request_resources_repo.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_state.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/repo/sales_repo.dart';

class AddRequestResourcesCubit extends Cubit<AddRequestResourcesState> {
  final SalesRepo _salesRepo;
  final AddRequestResourcesRepo _addRequestResourcesRepo;

  AddRequestResourcesCubit(this._salesRepo, this._addRequestResourcesRepo)
      : super(InitialState());

  static List<ResourceTypeClass> resourcesTypes = AppConstant.resourcesTypes;

  ResourceTypeClass selectedResourcesTypes = resourcesTypes[0];

  changeSelectedBillType(ResourceTypeClass value) {
    selectedResourcesTypes = value;
    getCategoriesFromHere();
    changeSelectedCategory(null);
    selectedProducts = [];
    emit(OnChangeResourcesTypeSelectState());
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

  //
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
        .getCategoryProducts(categoryID, null, categoryProductsCurrentPage)
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
        .getSearchProducts(
            searchProductController.text, null, searchProductsCurrentPage)
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
  List<ResourceSelectedProduct> selectedProducts = [];

  addProductToSelectedProducts(ResourceSelectedProduct value) {
    selectedProducts.add(value);
    emit(OnChangeSelectedProductState());
  }

  editInProductFromSelectedProducts(ResourceSelectedProduct value) {
    int index = selectedProducts.indexWhere(
      (element) =>
          element.product.productCode ==
          value.product.productCode, // Compare by product code
    );
    if (index != -1) {
      selectedProducts[index] = value;
    }
    emit(OnChangeSelectedProductState());
  }

  removeProductFromSelectedProducts(ResourceSelectedProduct value) {
    selectedProducts.removeWhere(
        (item) => item.product.productCode == value.product.productCode);
    emit(OnChangeSelectedProductState());
  }

  bool selectedProductsIsContainProduct(ResourceSelectedProduct value) {
    return selectedProducts
        .any((item) => item.product.productCode == value.product.productCode);
  }

  changeState() {
    emit(OnChangeSelectedProductState());
  }

  /// add Request Resources
  addRequestResources(BuildContext context) {
    emit(OnAddResourcesLoadingState());
    _addRequestResourcesRepo
        .addRequestResources(CreateRequestResourcesRequest(
            type: selectedResourcesTypes.id,
            resourceItems: selectedProducts
                .map((item) => ResourceItem(
                    itemId: item.product.id,
                    itemName: item.product.nameAr,
                    price: item.product.sellingPrice,
                    requestQuantity: item.requestQuantity,
                    yourQuantity: item.yourQuantity))
                .toList()))
        .then((value) {
      value.fold((l) {
        emit(OnAddResourcesErrorState(message: l.message));
      }, (r) {
        // context.pushNamed(Routes.electronicInvoiceScreen,
        //     arguments: {"orderId": r.orderId});
        emit(OnAddResourcesSuccessState(orderId: r.id ?? 0));
      });
    }).catchError((error) {
      emit(OnAddResourcesCatchErrorState(message: "error".tr()));
    });
  }

  static AddRequestResourcesCubit get(context) => BlocProvider.of(context);
}
