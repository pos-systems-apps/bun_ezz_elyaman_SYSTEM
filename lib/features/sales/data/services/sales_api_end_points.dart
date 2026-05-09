import 'package:pos_system/core/api/end_points.dart';

class SalesApiEndPoints {
  static final getCategoriesUrl =
      '${EndPoints.baseUrl}api/delegate/categories';
  static final getResourcesCategoriesUrl = '${EndPoints.baseUrl}api/delegate/all-categories';



  static getCategoryProductsUrl(int categoryID,String search) =>
      '${EndPoints.baseUrl}api/delegate/trips/products?category_id=$categoryID&search=$search';



  static getCategoryProductsResourcesUrl(int categoryID,String search) =>
      '${EndPoints.baseUrl}api/delegate/all-products?category_id=$categoryID&search=$search';







  static final createOrderURl = '${EndPoints.baseUrl}api/delegate/orders';
  static final createReturnURl = '${EndPoints.baseUrl}api/delegate/returns';

}
