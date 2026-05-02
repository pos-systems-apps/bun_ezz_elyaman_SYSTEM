import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class SalesApiEndPoints {
  static getCategoriesUrl(int page) =>
      '${EndPoints.baseUrl}api/v1/category/list?offset=$page';

  static getCategoryProductsUrl(int categoryID, int? type, int page) =>
      '${EndPoints.baseUrl}api/v1/stocks/list?category_id=$categoryID&type=$type&offset=$page';

  static getSearchProductsUrl(
           String name, int? type) =>
      '${EndPoints.baseUrl}api/v1/product/search?name=$name&type=$type';

  static final createOrderURl = '${EndPoints.baseUrl}api/v1/pos/place/order';
  static final createReturnURl = '${EndPoints.baseUrl}api/v1/pos/place/return';

}
