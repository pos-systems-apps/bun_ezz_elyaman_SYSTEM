import 'package:pos_system/core/utils/app_constant.dart';

class SplashApiEndPoints {
  static getUsersUrl(String name) =>
      '${AppConstant.baseUrl}api/v1/customer/search?name=$name';

  static final getBankAccountsUrl = '${AppConstant.baseUrl}api/v1/account/list';
  static final getCategoriesAndRegionsUrl = '${AppConstant.baseUrl}api/v1/customer/listcategory';
}
