import 'package:pos_system/core/utils/app_constant.dart';

class MyRequestsApiEndPoints {
  static getCategoriesUrl(int page) =>
      '${AppConstant.baseUrl}api/v1/category/list?offset=$page';

  static getCategoryProductsUrl(int categoryID, int type, int page) =>
      '${AppConstant.baseUrl}api/v1/stocks/list?category_id=$categoryID&type=$type&offset=$page';

  static getSearchProductsUrl(
           String name, int type, int page) =>
      '${AppConstant.baseUrl}api/v1/product/search?name=$name&type=$type&offset=$page';

  static final createOrderURl = '${AppConstant.baseUrl}api/v1/pos/place/order';

}
