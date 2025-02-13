import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class SelectedProductClass {
  Product product;
  int maxValueCounter;
  int minValueCounter;

  SelectedProductClass({
    required this.product,
    this.maxValueCounter = 0,
    this.minValueCounter = 0,
  });
}
