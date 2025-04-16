import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  double getProductExtraDiscountPriceInReseat(
      InvoiceDetail product, double discount, double totalPrice) {
    return ((((product.price * product.quantity) - (product.discountPerItem * product.quantity)) / totalPrice) * discount) /
        product.quantity;
  }

  double getProductTotalPrice(
      InvoiceDetail product, double discount, double totalPrice) {
    return product.price -
        product.discountPerItem -
        getProductExtraDiscountPriceInReseat(product, discount, totalPrice) +
        product.taxPerItem;
  }

  double getTotalPriceReturnedProducts(
      List<SelectedReturnProductClass> products, double discount, double totalPrice) {
    double totalProductPrice = 0;
    for (var item in products) {
      totalProductPrice += (item.returnQuantity * getProductTotalPrice(item.product, discount, totalPrice));
    }
    return totalProductPrice;
  }
}

class SelectedReturnProductClass {
  InvoiceDetail product;
  double returnQuantity;

  SelectedReturnProductClass({
    required this.product,
    this.returnQuantity = 0,
  });
}
