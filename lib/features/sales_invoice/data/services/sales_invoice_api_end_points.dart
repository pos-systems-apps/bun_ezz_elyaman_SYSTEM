import 'package:pos_system/core/utils/app_constant.dart';

class SalesInvoiceApiEndPoints {
  static getInvoicesUrl(int type) =>
      '${AppConstant.baseUrl}api/v1/pos/order/list?type=$type';
}
