import 'package:pos_system/core/utils/app_constant.dart';

class MyRequestsApiEndPoints {
  static getAllRequestsUrl(int type) =>
      '${AppConstant.baseUrl}api/v1/develop/$type';


}
