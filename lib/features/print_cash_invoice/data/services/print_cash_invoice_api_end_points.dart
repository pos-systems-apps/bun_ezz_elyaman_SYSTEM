import 'package:pos_system/core/utils/app_constant.dart';

class PrintCashInvoiceApiEndPoints {
  static getCashInvoiceDetailsUrl(int instalmentID) =>
      '${AppConstant.baseUrl}api/v1/pos/installment/invoice?installment_id=$instalmentID';
}
