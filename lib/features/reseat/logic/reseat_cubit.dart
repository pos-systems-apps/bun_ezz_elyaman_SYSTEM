import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/reseat_repo.dart';
import 'reseat_state.dart';

class ReseatCubit extends Cubit<ReseatState> {
  final ReseatRepo _reseatRepo;

  ReseatCubit(this._reseatRepo) : super(InitialState());
  final TextEditingController searchUserController = TextEditingController();
  int? selectedBillType;

  changeSelectedBillType(int value) {
    selectedBillType = value;
    emit(OnChangeBillTypeSelectState());
  }

  clearSelectedBillType() {
    selectedBillType = null;
    emit(OnChangeBillTypeSelectState());
  }

  List<Category> categories = [
    Category(1, "مثلجات"),
    Category(2, "طعام سريع"),
    Category(3, "مشروبات"),
    Category(4, "بطاطس"),
    Category(5, "مثلجات2"),
    Category(6, "مثلجات3"),
  ];

  Category? selectedCategory;

  changeSelectedCategory(Category value) {
    selectedCategory = value;
    emit(OnChangeSelectedCategoryState());
  }

  List<Product> products = [
    Product(1, "product1"),
    Product(2, "product2"),
    Product(3, "product3"),
    Product(4, "product4"),
    Product(5, "product5"),
    Product(6, "product6"),
  ];

  List<Product> selectedProducts = [];

  addProductToSelectedProducts(Product value) {
    selectedProducts.add(value);
    emit(OnChangeSelectedProductState());
  }

  removeProductFromSelectedProducts(Product value) {
    selectedProducts.removeWhere((item) => item.id == value.id);
    emit(OnChangeSelectedProductState());
  }

  bool selectedProductsIsContainProduct(Product value) {
    return selectedProducts.contains(value);
  }

  ///
  cancelCollection() {
    searchUserController.clear();
    clearSelectedBillType();
  }

  static ReseatCubit get(context) => BlocProvider.of(context);
}

class Category {
  int id;
  String name;

  Category(this.id, this.name);
}

class Product {
  int id;
  String name;

  Product(this.id, this.name);
}
