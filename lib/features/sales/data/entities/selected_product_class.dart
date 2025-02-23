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
    this.totalReseat = 0,
    this.totalDiscount = 0,
    this.extraDiscount = 0,
    this.valueTax = 0,
    this.total = 0,
  });

  double getTotalReseat() {
    totalReseat = 0;
    for (var element in selectedProducts) {
      double selectedQuantity = double.tryParse(
              "${element.maxValueCounter}.${element.minValueCounter}") ??
          1;
      totalReseat += (element.product.sellingPrice * selectedQuantity);
    }
    return totalReseat;
  }

  double getTotalDiscount() {
    totalDiscount = 0;
    for (var element in selectedProducts) {
      double selectedQuantity = double.tryParse(
              "${element.maxValueCounter}.${element.minValueCounter}") ??
          1;
      double itemDiscount = 0;
      if (element.product.discountType == "percent") {
        itemDiscount =
            (element.product.discount / 100) * element.product.sellingPrice;
      } else {
        itemDiscount = element.product.discount;
      }

      totalDiscount += (itemDiscount * selectedQuantity);
    }
    return totalDiscount;
  }

  double getExtraDiscount(int? discountId, String discount) {
    extraDiscount = 0;
    double productsPriceAfterDiscount = getTotalReseat() - getTotalDiscount();
    if (discountId == 2) {
      extraDiscount =
          ((double.tryParse(discount) ?? 0) * productsPriceAfterDiscount) / 100;
    } else {
      extraDiscount = (double.tryParse(discount) ?? 0);
    }
    return extraDiscount;
  }

  double getValueTax(int? discountId, String discount) {
    valueTax = 0;
    double productsPriceAfterAllDiscounts = getTotalReseat() -
        getTotalDiscount() -
        getExtraDiscount(discountId, discount);
    valueTax = (productsPriceAfterAllDiscounts * 15) / 100;
    return valueTax;
  }

  double getTotal(int? discountId, String discount) {
    total = 0;
    total = getTotalReseat() -
        getTotalDiscount() -
        getExtraDiscount(discountId, discount) +
        getValueTax(discountId, discount);
    return total;
  }
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
