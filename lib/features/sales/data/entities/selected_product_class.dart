import 'package:flutter/material.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class ReseatSelectedProducts {
  List<SelectedProductClass> selectedProducts;
  double totalReseat;
  double totalDiscount;
  double extraDiscount;
  double valueTax;
  double total;

  ReseatSelectedProducts({
    required this.selectedProducts,
     this.totalReseat=0,
     this.totalDiscount=0,
     this.extraDiscount=0,
     this.valueTax=0,
     this.total=0,
  });

   double getTotalReseat() {
    print(selectedProducts.length);
    for (var element in selectedProducts) {
      print("---------------------");
      print(element.product.sellingPrice);
      double quantity = double.tryParse(
              "${element.maxValueCounter}.${element.minValueCounter}") ??
          1;
      debugPrint("quantity ${quantity}");

      totalReseat += (element.product.sellingPrice * quantity);
      debugPrint("totalReseat ${totalReseat}");
    }

    return totalReseat;
  }

  static getTotalDiscount(List<SelectedProductClass> items) {
    // return
  }

  static getExtraDiscount(List<SelectedProductClass> items) {}

  static getValueTax(List<SelectedProductClass> items) {}

  static getTotal(List<SelectedProductClass> items) {}
}

class SelectedProductClass {
  Product product;
  int maxValueCounter;
  int minValueCounter;

  SelectedProductClass({
    required this.product,
    this.maxValueCounter = 0,
    this.minValueCounter = 0,
  });
}
