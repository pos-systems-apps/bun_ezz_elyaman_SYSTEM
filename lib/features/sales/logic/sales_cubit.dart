import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/print_invoice/data/repo/print_invoice_repo.dart';
import 'package:pos_system/features/sales/data/entities/percent_types_class.dart';
import 'package:pos_system/features/sales/data/entities/returned_product_class.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_return_order_request.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
import '../data/repo/sales_repo.dart';
import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepo _salesRepo;
  final SplashRepo _splashRepo;
  final PrintInvoiceRepo _printInvoiceRepo;

  SalesCubit(this._salesRepo, this._splashRepo, this._printInvoiceRepo)
      : super(InitialState());

  ///sales section
  static List<OrderTypeClass> orderTypes = AppConstant.orderTypes;

  OrderTypeClass selectedOrderType = orderTypes[0];

  changeSelectedBillType(OrderTypeClass value) {
    selectedOrderType = value;
    if (value.id == AppConstant.orderTypes[0].id) {
      getCategories();
      changeSelectedCategory(null);
      // selectedProducts = [];
    } else {}
    emit(OnChangeOrderTypeSelectState());
  }

  ///categories




  List<CategoryModel> categories = [];

  getCategories() {
    emit(OnGetCategoryLoadingState());
    _salesRepo.getCategories('s').then((value) {
      value.fold((l) {
        emit(OnGetCategoryErrorState());
      }, (r) {

        categories   =r.data ;
        if (r.data.isNotEmpty &&
            selectedCategory == null) {
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
      getCategoryProducts(value.id);
    }

    emit(OnChangeSelectedCategoryState());
  }

  ///products
  List<TripProductModel> products = [];



  getCategoryProducts(int categoryID) {
    emit(OnGetCategoryProductsLoadingState());
    _salesRepo
        .getCategoryProducts('s',categoryID, '',
             )
        .then((value) {
      value.fold((l) {
        emit(OnGetCategoryProductsErrorState());
      }, (r) {

        products=r.data;
        emit(OnGetCategoryProductsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoryProductsCatchErrorState());
    });
  }

  ///search product
  ///
  TextEditingController searchProductController = TextEditingController();

  changeSearchController(String search) {
    searchProductController.text = search;
    getSearchProductsFromHere();
  }

  List<TripProductModel> searchProducts = [];

  getSearchProductsFromHere() {
    searchProducts = [];
    getSearchProducts();
  }

  getSearchProducts() {
    emit(OnGetSearchProductsLoadingState());
    _salesRepo
        .getCategoryProducts('s',
      selectedCategory?.id??0,   searchProductController.text  )
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
  //






  List<SelectedProductClass> selectedProducts = [];

  void addProductToSelectedProducts(SelectedProductClass value) {
    final index = selectedProducts.indexWhere(
          (element) => element.product.id == value.product.id,
    );

    if (index == -1) {
      selectedProducts.add(value);
    } else {
      selectedProducts[index] = value;
    }

    emit(OnChangeSelectedProductState());
  }

  void editInProductFromSelectedProducts(SelectedProductClass value) {
    final index = selectedProducts.indexWhere(
          (element) => element.product.id == value.product.id,
    );

    if (index != -1) {
      selectedProducts[index] = value;
      emit(OnChangeSelectedProductState());
    }
  }

  void removeProductFromSelectedProducts(SelectedProductClass value) {
    selectedProducts.removeWhere(
          (item) => item.product.id == value.product.id,
    );

    emit(OnChangeSelectedProductState());
  }

  bool selectedProductsIsContainProduct(SelectedProductClass value) {
    return selectedProducts.any(
          (item) => item.product.id == value.product.id,
    );
  }

  SelectedProductClass? getSelectedProduct(TripProductModel product) {
    try {
      return selectedProducts.firstWhere(
            (item) => item.product.id == product.id,
      );
    } catch (e) {
      return null;
    }
  }


  void increaseProductQuantity(TripProductModel product) {
    final selectedProduct = getSelectedProduct(product);

    if (selectedProduct == null) {
      addProductToSelectedProducts(
        SelectedProductClass(
          product: product,
          quantity: 1,
        ),
      );
    } else {
      selectedProduct.quantity++;
      emit(OnChangeSelectedProductState());
    }
  }

  void decreaseProductQuantity(TripProductModel product) {
    final selectedProduct = getSelectedProduct(product);

    if (selectedProduct == null) return;

    if (selectedProduct.quantity > 1) {
      selectedProduct.quantity--;
      emit(OnChangeSelectedProductState());
    } else {
      removeProductFromSelectedProducts(selectedProduct);
    }
  }

  void changeProductQuantity({
    required TripProductModel product,
    required double quantity,
  }) {
    final selectedProduct = getSelectedProduct(product);

    if (quantity <= 0) {
      if (selectedProduct != null) {
        removeProductFromSelectedProducts(selectedProduct);
      }
      return;
    }

    if (selectedProduct == null) {
      addProductToSelectedProducts(
        SelectedProductClass(
          product: product,
          quantity: quantity,
        ),
      );
    } else {
      selectedProduct.quantity = quantity;
      emit(OnChangeSelectedProductState());
    }
  }


  void increaseProductMaxQuantity(TripProductModel product) {
    increaseProductQuantity(product);
  }

  void decreaseProductMaxQuantity(TripProductModel product) {
    decreaseProductQuantity(product);
  }

  void changeProductMinQuantity({
    required TripProductModel product,
    required int quantity,
  }) {
    changeProductQuantity(
      product: product,
      quantity: quantity.toDouble(),
    );
  }


  // void increaseProductMaxQuantity(TripProductModel product) {
  //   final selectedProduct = getSelectedProduct(product);
  //
  //   if (selectedProduct == null) {
  //     addProductToSelectedProducts(
  //       SelectedProductClass(
  //         product: product,
  //         maxValueCounter: 1,
  //         minValueCounter: 0,
  //       ),
  //     );
  //   } else {
  //     selectedProduct.maxValueCounter++;
  //     emit(OnChangeSelectedProductState());
  //   }
  // }
  //
  // void decreaseProductMaxQuantity(TripProductModel product) {
  //   final selectedProduct = getSelectedProduct(product);
  //
  //   if (selectedProduct == null) return;
  //
  //   if (selectedProduct.maxValueCounter > 1) {
  //     selectedProduct.maxValueCounter--;
  //   } else {
  //     removeProductFromSelectedProducts(selectedProduct);
  //     return;
  //   }
  //
  //   emit(OnChangeSelectedProductState());
  // }
  //
  // void changeProductMinQuantity({
  //   required TripProductModel product,
  //   required int quantity,
  // }) {
  //   final selectedProduct = getSelectedProduct(product);
  //
  //   if (selectedProduct == null) {
  //     addProductToSelectedProducts(
  //       SelectedProductClass(
  //         product: product,
  //         maxValueCounter: 0,
  //         minValueCounter: quantity,
  //       ),
  //     );
  //   } else {
  //     selectedProduct.minValueCounter = quantity;
  //     emit(OnChangeSelectedProductState());
  //   }
  // }
  //
  // void changeProductMaxUnit({
  //   required TripProductModel product,
  //   required AvailableUnitModel unit,
  // }) {
  //   final selectedProduct = getSelectedProduct(product);
  //
  //   if (selectedProduct == null) {
  //     addProductToSelectedProducts(
  //       SelectedProductClass(
  //         product: product,
  //         selectedMaxUnit: unit,
  //       ),
  //     );
  //   } else {
  //     selectedProduct.selectedMaxUnit = unit;
  //     emit(OnChangeSelectedProductState());
  //   }
  // }
  //
  // void changeProductMinUnit({
  //   required TripProductModel product,
  //   required AvailableUnitModel unit,
  // }) {
  //   final selectedProduct = getSelectedProduct(product);
  //
  //   if (selectedProduct == null) {
  //     addProductToSelectedProducts(
  //       SelectedProductClass(
  //         product: product,
  //         selectedMinUnit: unit,
  //       ),
  //     );
  //   } else {
  //     selectedProduct.selectedMinUnit = unit;
  //     emit(OnChangeSelectedProductState());
  //   }
  // }

  void clearSelectedProducts() {
    selectedProducts.clear();
    emit(OnChangeSelectedProductState());
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
      getIt<AppConstant>().pays.toList();

  PayClass? selectedPay;

  changeSelectedPay(PayClass value) {
    selectedPay = value;
    emit(OnChangePaySelectState());
  }

  PercentTypesClass? selectedPercentType;
  TextEditingController percentController = TextEditingController();

  TextEditingController moneyController = TextEditingController();

  ///customers
  List<UserModel> users = [];

  getUsers() {
    emit(OnGetUsersLoadingState());
    _splashRepo.getUsers(searchUserController.text).then((value) {
      value.fold((l) {
        emit(OnGetUsersErrorState());
      }, (r) {
        users = r.data??[];
        emit(OnGetUsersSuccessState());
      });
    }).catchError((error) {
      emit(OnGetUsersCatchErrorState());
    });
  }

  UserModel? selectedUser;

  onSelectUser(UserModel vale) {
    searchUserController.text = vale.name??'';
    selectedUser = vale;
    users.clear();
    emit(OnSelectUserState());
  }

  /// CREATE ORDER

  String _getPaymentMethod() {
    /// عدل الأرقام حسب selectedPay عندك
    /// cash, credit, partial

    if (selectedPay?.id == 2) {
      return "partial";
    }

    if (selectedPay?.id == 3) {
      return "credit";
    }

    return "cash";
  }

  double? _getOrderDiscountAmount() {
    final value = double.tryParse(percentController.text);

    if (value == null || value <= 0) {
      return null;
    }

    return value;
  }

  String? _getOrderDiscountType() {
    final discountValue = double.tryParse(percentController.text);

    if (discountValue == null || discountValue <= 0) {
      return null;
    }

    /// selectedPercentType?.id == 1 معناها fixed
    /// غير كده percentage
    if (selectedPercentType?.id == 1) {
      return "fixed";
    }

    return "percentage";
  }

  void createOrder(BuildContext context) async{
    emit(OnCreateOrderLoadingState());

    final receiptCalculator = ReseatSelectedProducts(
      selectedProducts: selectedProducts,
    );

    final receiptData = receiptCalculator.getReseatData(
      discountTypeId: selectedPercentType?.id,
      discount: percentController.text,
    );

    final String paymentMethod = _getPaymentMethod();

    final double totalAmount = receiptData['total'] ?? 0;

    final double paidAmount = paymentMethod == "partial"
        ? double.tryParse(moneyController.text) ?? 0
        : paymentMethod == "credit"
        ? 0
        : totalAmount;

    final request = CreateOrderRequest(
      customerId: selectedUser!.id??0,
      paymentMethod: paymentMethod,
      discountAmount: _getOrderDiscountAmount(),
      discountType: _getOrderDiscountType(),
      dueDate: null,
      notes: null,
      paidAmount: paidAmount,
      items: selectedProducts.map((element) {
        return CreateOrderItemRequest(
          productId: element.product.id,
          unitId: element.product.unit?.id,
          quantity: element.quantity,
          unitPrice: element.product.sellingPrice,
          discount: element.discountMoney,
          discountType: "fixed",
          taxAmount: receiptCalculator.getProductTaxesPriceInReseat(
            element,
            selectedPercentType?.id,
            percentController.text,
            totalPrice: (receiptData['totalReseat'] ?? 0) -
                (receiptData['totalDiscount'] ?? 0),
          ),
        );
      }).toList(),
    );

    await _salesRepo.createOrder(request).then((value) {
      value.fold(
            (l) {
          emit(OnCreateOrderErrorState(message: l.message));
        },
            (r) {
          emit(OnCreateOrderSuccessState(orderId: r.orderId ?? 0));

          // لو عايز تروح لشاشة الفاتورة بعد النجاح
          // context.pushNamed(
          //   Routes.electronicInvoiceScreen,
          //   arguments: {"orderId": r.orderId},
          // );
        },
      );
    }).catchError((error) {
      emit(OnCreateOrderCatchErrorState(message: "error".tr()));
    });
  }

  ///return section

  TextEditingController billIdController = TextEditingController();

  GlobalKey<FormState> billKey = GlobalKey();

  InvoiceResponseModel? invoiceResponseModel;

  removeReturnInvoiceData() {
    invoiceResponseModel = null;
    selectedReturnProducts.clear();
  }

  getInvoiceDetails() {
    removeReturnInvoiceData();
    emit(OnGetInvoiceDetailsLoadingState());
    _printInvoiceRepo
        .getInvoiceDetails(4,int.tryParse(billIdController.text) ?? 0)
        .then((value) {
      value.fold((l) {
        emit(OnGetInvoiceDetailsErrorState());
      }, (r) {
        invoiceResponseModel = r;
        emit(OnGetInvoiceDetailsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetInvoiceDetailsCatchErrorState());
    });
  }

  List<SelectedReturnProductClass> selectedReturnProducts = [];

  addProductToSelectedReturnProducts(SelectedReturnProductClass value) {
    selectedReturnProducts.add(value);
    emit(OnChangeSelectedReturnProductState());
  }

  removeProductFromSelectedReturnProducts(SelectedReturnProductClass value) {
    selectedReturnProducts
        .removeWhere((item) => item.product.id == value.product.id);
    emit(OnChangeSelectedReturnProductState());
  }

  bool selectedReturnedProductsIsContainProduct(
      SelectedReturnProductClass value) {
    return selectedReturnProducts
        .any((item) => item.product.id == value.product.id);
  }

  /// RETURN ORDER
  void returnOrder(BuildContext context) async{
    emit(OnCreateReturnLoadingState());

    final int saleOrderId = int.tryParse(billIdController.text) ?? 0;

    final request =  CreateReturnOrderRequest(
      saleOrderId: saleOrderId,
      notes: null,
      items: selectedReturnProducts.map((item) {
        return CreateSaleReturnItemRequest(
          productId: item.product.product?.id ?? 0,
          unitId: item.product.unit?.id,
          quantity: item.returnQuantity,
          unitPrice: item.product.unitPrice,
          reason: null,
          saleOrderItemId: item.product.id,
        );
      }).toList(),
    );

   await _salesRepo.createReturn(request).then((value) {
      value.fold(
            (l) {
          emit(OnCreateReturnErrorState(message: l.message));
        },
            (r) {
          emit(OnCreateReturnSuccessState(returnOrderId: r.data?.id ?? 0));
        },
      );
    }).catchError((error) {
      emit(OnCreateReturnCatchErrorState(message: "error".tr()));
    });
  }
  static SalesCubit get(context) => BlocProvider.of(context);
}
