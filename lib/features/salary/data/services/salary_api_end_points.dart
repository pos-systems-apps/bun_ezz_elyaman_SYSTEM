import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class SalaryApiEndPoints {
  static getSalaryUrl(String date) =>
      '${EndPoints.baseUrl}api/v1/salary?month=$date';
}
