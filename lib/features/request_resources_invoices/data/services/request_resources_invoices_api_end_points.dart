import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class RequestResourcesInvoicesApiEndPoints {
  static getRequestResourcesInvoicesUrl(int type) =>
      '${EndPoints.baseUrl}api/v1/product/reservation/list/$type';
}
