import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class MyRequestsApiEndPoints {
  static getAllRequestsUrl(int type) =>
      '${EndPoints.baseUrl}api/delegate/hr/leaves?status=approved&type=annual&page=1&per_page=10000';


}
