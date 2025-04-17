import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  double getProductTotalPrice(
      InvoiceDetail product) {
//20.6797908
  //11.97888494
    print("object/////");
    print("product.price  ${product.price }");
    print("product.discountPerItem  ${product.discountPerItem }");
    print("product.extraDiscountPerItem  ${product.extraDiscountPerItem }");
    print("product.taxPerItem  ${product.taxPerItem }");
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
