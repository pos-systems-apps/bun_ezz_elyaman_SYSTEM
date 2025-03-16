import 'package:pos_system/core/utils/app_constant.dart';

///
class PrintResourcesInvoicesApiEndPoints {
  static getResourcesInvoiceDetails(int installmentID) =>
      '${AppConstant.baseUrl}api/v1/pos/installment/invoice?installment_id=$installmentID';
}
