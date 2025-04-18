import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class SearchProductsResponse {
  List<Product> categoryProducts;

  SearchProductsResponse({
    required this.categoryProducts,
  });

  factory SearchProductsResponse.fromJson(Map<String, dynamic> json) =>
      SearchProductsResponse(
        categoryProducts: List<Product>.from(
            json['products'].map((item) => Product.fromJson(item))),
      );
}
