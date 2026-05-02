import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class SplashApiEndPoints {
  static getUsersUrl(String name) =>
      '${EndPoints.baseUrl}api/delegate/customers?search=$name';

  static final getBankAccountsUrl = '${EndPoints.baseUrl}api/v1/account/list';
  static final getCategoriesAndRegionsUrl = '${EndPoints.baseUrl}api/v1/customer/listcategory';
}
