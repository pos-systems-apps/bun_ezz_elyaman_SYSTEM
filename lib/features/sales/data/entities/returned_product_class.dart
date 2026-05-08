import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  double getProductTotalPrice(InvoiceItemModel product) {
    return product.unitPrice -
        product.discount -
        0 +
        product.taxAmount;
  }

  double getTotalPriceReturnedProducts(
      List<SelectedReturnProductClass> products,
      ) {
    double totalProductPrice = 0;

    for (var item in products) {
      totalProductPrice +=
          item.returnQuantity * getProductTotalPrice(item.product);
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