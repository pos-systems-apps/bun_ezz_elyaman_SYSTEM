import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class SearchProductsResponse {
  int currentPage;
  int lastPage;
  List<Product> categoryProducts;

  SearchProductsResponse({
    required this.currentPage,
    required this.lastPage,
    required this.categoryProducts,
  });

  factory SearchProductsResponse.fromJson(Map<String, dynamic> json) =>
      SearchProductsResponse(
        currentPage: json['current_page'].toInt(),
        lastPage: json['last_page'],
        categoryProducts: List<Product>.from(
            json['products'].map((item) => Product.fromJson(item))),
      );
}
