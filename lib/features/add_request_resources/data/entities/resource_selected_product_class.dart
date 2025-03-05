import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class ResourceSelectedProductClass {
  List<ResourceSelectedProduct> selectedProducts;

  ResourceSelectedProductClass({
    required this.selectedProducts,
  });
}

class ResourceSelectedProduct {
  Product product;
  double stock; //your data that you need
  double quantity; // your items that you have

  ResourceSelectedProduct({
    required this.product,
    this.stock = 0,
    this.quantity = 0,
  });
}
