import 'package:pos_system/core/utils/app_constant.dart';

class SalaryApiEndPoints {
  static getSalaryUrl(String date) =>
      '${AppConstant.baseUrl}api/v1/salary?month=$date';
}
