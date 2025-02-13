// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pos_system/core/utils/app_constant.dart';
// import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
// import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
// import '../data/repo/reseat_repo.dart';
// import 'reseat_state.dart';
//
// class ReseatCubit extends Cubit<ReseatState> {
//   final ReseatRepo _reseatRepo;
//
//   ReseatCubit(this._reseatRepo, this.selectedProducts) : super(InitialState());
//
//   static List<OrderTypeClass> orderTypes = AppConstant.orderTypes;
//   TextEditingController searchUserController = TextEditingController();
//
//   ///selected product
//   List<SelectedProductClass> selectedProducts;
//
//   addProductToSelectedProducts(SelectedProductClass value) {
//     selectedProducts.add(value);
//     emit(OnChangeSelectedProductState());
//   }
//
//   removeProductFromSelectedProducts(SelectedProductClass value) {
//     selectedProducts.removeWhere(
//         (item) => item.product.productCode == value.product.productCode);
//     emit(OnChangeSelectedProductState());
//   }
//
//   bool selectedProductsIsContainProduct(SelectedProductClass value) {
//     return selectedProducts
//         .any((item) => item.product.productCode == value.product.productCode);
//   }
//
//   static ReseatCubit get(context) => BlocProvider.of(context);
// }
