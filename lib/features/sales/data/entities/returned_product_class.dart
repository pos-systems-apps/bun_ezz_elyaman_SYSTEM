import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  // سعر الوحدة بعد الخصم = (إجمالي السطر × نسبة الخصم) ÷ الكمية
  double getProductTotalPrice(InvoiceItemModel product, {double discountRatio = 1.0}) {
    if (product.quantity > 0) {
      return (product.total * discountRatio) / product.quantity;
    }
    return product.unitPrice * discountRatio;
  }

  double getTotalPriceReturnedProducts(
      List<SelectedReturnProductClass> products, {
      double discountRatio = 1.0,
      }) {
    double totalProductPrice = 0;

    for (var item in products) {
      totalProductPrice +=
          item.returnQuantity * getProductTotalPrice(item.product, discountRatio: discountRatio);
    }

    return totalProductPrice;
  }
}

class SelectedReturnProductClass {
  InvoiceItemModel product;
  double returnQuantity;

  SelectedReturnProductClass({
    required this.product,
    this.returnQuantity = 0,
  });
}