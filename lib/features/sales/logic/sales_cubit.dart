import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/features/sales/data/entities/percent_types_class.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
import '../data/repo/sales_repo.dart';
import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepo _salesRepo;
  final SplashRepo _splashRepo;

  SalesCubit(this._salesRepo, this._splashRepo) : super(InitialState());

  static List<OrderTypeClass> orderTypes = AppConstant.orderTypes;

  OrderTypeClass selectedOrderType = orderTypes[0];

  changeSelectedBillType(OrderTypeClass value) {
    selectedOrderType = value;
    getCategoriesFromHere();
    changeSelectedCategory(null);
    selectedProducts = [];
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

  editInProductFromSelectedProducts(SelectedProductClass value) {
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

  removeProductFromSelectedProducts(SelectedProductClass value) {
    selectedProducts.removeWhere(
        (item) => item.product.productCode == value.product.productCode);
    emit(OnChangeSelectedProductState());
  }

  bool selectedProductsIsContainProduct(SelectedProductClass value) {
    return selectedProducts
        .any((item) => item.product.productCode == value.product.productCode);
  }

  changeState() {
    emit(OnChangeSelectedProductState());
  }

  TextEditingController searchUserController = TextEditingController();

  ///
  ///upload image

  String? selectedImagePath;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath = image.path;
      emit(OnChangeSelectedImageState());
    }
  }

  ///add extra discount

  ///pays
  List<PayClass> pays =
      getIt<AppConstant>().pays.where((item) => item.isShown).toList();

  PayClass? selectedPay;

  changeSelectedPay(PayClass value) {
    selectedPay = value;
    emit(OnChangePaySelectState());
  }

  PercentTypesClass? selectedPercentType;
  TextEditingController percentController = TextEditingController();

  // TextEditingController moneyController = TextEditingController();

  ///customers
  List<UserResponseData> users = [];

  getUsers() {
    emit(OnGetUsersLoadingState());
    _splashRepo.getUsers(searchUserController.text).then((value) {
      value.fold((l) {
        emit(OnGetUsersErrorState());
      }, (r) {
        users = r.userResponseData;
        emit(OnGetUsersSuccessState());
      });
    }).catchError((error) {
      emit(OnGetUsersCatchErrorState());
    });
  }

  UserResponseData? selectedUser;

  onSelectUser(UserResponseData vale) {
    searchUserController.text = vale.nameAr;
    selectedUser = vale;
    users.clear();
    emit(OnSelectUserState());
  }

  /// CREATE ORDER
  createOrder(BuildContext context) {
    emit(OnCreateOrderLoadingState());
    _salesRepo
        .createOrder(CreateOrderRequest(
            userId: selectedUser!.id,
            img: selectedImagePath,
            totalTax: 0,

            ///stop value tax
            // double.tryParse(
            //         ReseatSelectedProducts(selectedProducts: selectedProducts)
            //             .getValueTax(
            //                 selectedPercentType?.id, percentController.text)
            //             .toStringAsFixed(2)) ??
            //     0,
            extraDiscount: double.tryParse(ReseatSelectedProducts(selectedProducts: selectedProducts)
                    .getExtraDiscount(
                        selectedPercentType?.id, percentController.text)
                    .toStringAsFixed(2)) ??
                0,
            collectedCash: selectedPay!.id == 2
                ? 0
                : (double.tryParse(ReseatSelectedProducts(selectedProducts: selectedProducts)
                        .getTotal(
                            selectedPercentType?.id, percentController.text)
                        .toStringAsFixed(2)) ??
                    0),
            orderType: selectedOrderType.id,
            finalOrderAmount: double.tryParse(ReseatSelectedProducts(selectedProducts: selectedProducts)
                    .getTotal(selectedPercentType?.id, percentController.text)
                    .toStringAsFixed(2)) ??
                0,
            cash: selectedPay!.id,
            carts: selectedProducts.map((element) {
              return Cart(
                  id: element.product.id,
                  quantity: element.minValueCounter == 0
                      ? element.maxValueCounter.toDouble()
                      : ((element.maxValueCounter * element.product.unitValue) +
                              element.minValueCounter)
                          .toDouble(),
                  price: element.minValueCounter == 0
                      ? element.product.sellingPrice
                      : double.tryParse((element.product.sellingPrice /
                                  element.product.unitValue)
                              .toStringAsFixed(2)) ??
                          0,
                  unit: element.minValueCounter == 0 ? 1 : 0);
            }).toList()))
        .then((value) {
      value.fold((l) {
        emit(OnCreateOrderErrorState(message: l.message));
      }, (r) {
        // context.pushNamed(Routes.electronicInvoiceScreen,
        //     arguments: {"orderId": r.orderId});
        emit(OnCreateOrderSuccessState(orderId: r.orderId ?? 0));
      });
    }).catchError((error) {
      emit(OnCreateOrderCatchErrorState(message: "error".tr()));
    });
  }

  static SalesCubit get(context) => BlocProvider.of(context);
}
