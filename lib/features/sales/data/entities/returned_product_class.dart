import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  double getProductTotalPrice(
      InvoiceDetail product) {


   return product.price -
        product.discountPerItem -
        product.extraDiscountPerItem +
        product.taxPerItem;
  }

  double getTotalPriceReturnedProducts(
      List<SelectedReturnProductClass> products) {
    double totalProductPrice = 0;
    for (var item in products) {
      totalProductPrice += (item.returnQuantity * getProductTotalPrice(item.product));
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
