import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class ResourceSelectedProductClass {
  List<ResourceSelectedProduct> selectedProducts;

  ResourceSelectedProductClass({
    required this.selectedProducts,
  });
}

class ResourceSelectedProduct {
  TripProductModel product;
  double requestQuantity; //your data that you need
  double yourQuantity; // your items that you have

  ResourceSelectedProduct({
    required this.product,
    this.requestQuantity = 0,
    this.yourQuantity = 0,
  });
}
