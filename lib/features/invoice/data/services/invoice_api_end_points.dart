import 'package:pos_system/core/utils/app_constant.dart';

class InvoiceApiEndPoints {
  static getInvoiceDetails(int invoiceId) =>
      '${AppConstant.baseUrl}api/v1/pos/invoice?order_id=$invoiceId';
}
