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
    getCategories();
    changeSelectedCategory(null);
    selectedProducts = [];
    emit(OnChangeResourcesTypeSelectState());
  }

  ///categories

  List<CategoryModel> categories = [];

  getCategories() {
    print("object121212");
    emit(OnGetCategoryLoadingState());
    _salesRepo.getCategories().then((value) {
      value.fold((l) {
        emit(OnGetCategoryErrorState());
      }, (r) {
        categories = r.data;

        if (r.data.isNotEmpty && selectedCategory == null) {
          changeSelectedCategory(r.data[0]);
        }
        emit(OnGetCategorySuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoryCatchErrorState());
    });
  }

  CategoryModel? selectedCategory;

  ///call products
  changeSelectedCategory(CategoryModel? value) {
    selectedCategory = value;
    if (value != null) {
      getCategoryProductsFromHere(value.id);
    }
    emit(OnChangeSelectedCategoryState());
  }

  ///products
  List<TripProductModel> products = [];

  getCategoryProductsFromHere(int categoryID) {
    products = [];

    getCategoryProducts(categoryID);
  }

  //

  getCategoryProducts(int categoryID) {
    emit(OnGetCategoryProductsLoadingState());
    _salesRepo
        .getCategoryProducts(
      categoryID,
      '',
    )
        .then((value) {
      value.fold((l) {
        emit(OnGetCategoryProductsErrorState());
      }, (r) {
        products = r.data;

        emit(OnGetCategoryProductsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoryProductsCatchErrorState());
    });
  }

  ///search product
  ///
  TextEditingController searchProductController = TextEditingController();

  List<TripProductModel> searchProducts = [];

  getSearchProductsFromHere() {
    searchProducts = [];
    getSearchProducts();
  }

  getSearchProducts() {
    emit(OnGetSearchProductsLoadingState());
    _salesRepo
        .getCategoryProducts(selectedCategory?.id??0,searchProductController.text)
        .then((value) {
      value.fold((l) {
        emit(OnGetSearchProductsErrorState());
      }, (r) {
        searchProducts = r.data;
        emit(OnGetSearchProductsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetSearchProductsCatchErrorState());
    });
  }

  ///select product
  List<ResourceSelectedProduct> selectedProducts = [];
  //
  // addProductToSelectedProducts(ResourceSelectedProduct value) {
  //   selectedProducts.add(value);
  //   emit(OnChangeSelectedProductState());
  // }
  //
  // editInProductFromSelectedProducts(ResourceSelectedProduct value) {
  //   int index = selectedProducts.indexWhere(
  //     (element) =>
  //         element.product.productCode ==
  //         value.product.productCode, // Compare by product code
  //   );
  //   if (index != -1) {
  //     selectedProducts[index] = value;
  //   }
  //   emit(OnChangeSelectedProductState());
  // }

  // removeProductFromSelectedProducts(ResourceSelectedProduct value) {
  //   selectedProducts.removeWhere(
  //       (item) => item.product.productCode == value.product.productCode);
  //   emit(OnChangeSelectedProductState());
  // }
  //
  // bool selectedProductsIsContainProduct(ResourceSelectedProduct value) {
  //   return selectedProducts
  //       .any((item) => item.product.productCode == value.product.productCode);
  // }

  changeState() {
    emit(OnChangeSelectedProductState());
  }

  /// add Request Resources
  addRequestResources(BuildContext context) {
    // emit(OnAddResourcesLoadingState());
    // _addRequestResourcesRepo
    //     .addRequestResources(CreateRequestResourcesRequest(
    //         type: selectedResourcesTypes.id,
    //         resourceItems: selectedProducts
    //             .map((item) => ResourceItem(
    //                 itemId: item.product.id,
    //                 itemName: item.product.nameAr,
    //                 price: item.product.sellingPrice,
    //                 requestQuantity: item.requestQuantity,
    //                 yourQuantity: item.yourQuantity))
    //             .toList()))
    //     .then((value) {
    //   value.fold((l) {
    //     emit(OnAddResourcesErrorState(message: l.message));
    //   }, (r) {
    //     // emit(OnAddResourcesSuccessState(orderId: r.id ?? 0));
    //   });
    // }).catchError((error) {
    //   emit(OnAddResourcesCatchErrorState(message: "error".tr()));
    // });
  }

  static AddRequestResourcesCubit get(context) => BlocProvider.of(context);
}
