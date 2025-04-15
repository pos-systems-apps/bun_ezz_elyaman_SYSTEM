import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';

class ReturnedProductClass {
  ReturnedProductClass();

  double getProductExtraDiscountPriceInReseat(
      InvoiceDetail product, double discount, double totalPrice) {

    print("discount  ${discount}");
    print("product.price  ${product.price}");
    print("product.quantity  ${product.quantity}");
    print("  product.discountPerItem ${product.discountPerItem} ");
    print("totalPrice${totalPrice}");

    return ((((product.price * product.quantity) - (product.discountPerItem * product.quantity)) / totalPrice) * discount) /
        product.quantity;
  }

  double getProductTotalPrice(
      InvoiceDetail product, double discount, double totalPrice) {

    // print(" getProductExtraDiscountPriceInReseat(product, discount, totalPrice) ${ getProductExtraDiscountPriceInReseat(product, discount, totalPrice)}");
    // print("price  ${product.price}");
    // print("  product.discountPerItem ${product.discountPerItem} ");
    // print("product.taxPerItem${product.taxPerItem}");
    return product.price -
        product.discountPerItem -
        getProductExtraDiscountPriceInReseat(product, discount, totalPrice) +
        product.taxPerItem;
  }

  double getTotalPriceReturnedProducts(
      List<SelectedReturnProductClass> products, double discount, double totalPrice) {
    double totalPrice = 0;
    for (var item in products) {
      print("item.returnQuantity ${item.returnQuantity}");
      print("getProductTotalPrice(item.product, discount, totalPrice) ${getProductTotalPrice(item.product, discount, totalPrice)}");
      totalPrice += (item.returnQuantity * getProductTotalPrice(item.product, discount, totalPrice));
    }
    return totalPrice;
  }
}

class SelectedReturnProductClass {
  InvoiceDetail product;
  int returnQuantity;

  SelectedReturnProductClass({
    required this.product,
    this.returnQuantity = 0,
  });
}
