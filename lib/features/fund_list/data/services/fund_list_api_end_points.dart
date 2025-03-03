import 'package:pos_system/core/utils/app_constant.dart';

class FundListApiEndPoints {
  static getFundListUrl(String? from,String? to) =>
      '${AppConstant.baseUrl}api/v1/transactionseller/listalltodaybyseller?from=${from??""}&to=${to??""}';
}
