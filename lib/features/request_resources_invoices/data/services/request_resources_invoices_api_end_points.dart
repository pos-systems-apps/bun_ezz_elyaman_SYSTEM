import 'package:pos_system/core/utils/app_constant.dart';

class RequestResourcesInvoicesApiEndPoints {
  static getRequestResourcesInvoicesUrl(int type) =>
      '${AppConstant.baseUrl}api/v1/product/reservation/list/$type';
}
