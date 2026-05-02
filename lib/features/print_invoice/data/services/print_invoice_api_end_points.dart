import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class PrintInvoiceApiEndPoints {
  static getInvoiceDetails(int invoiceId) =>
      '${EndPoints.baseUrl}api/v1/pos/invoice?order_id=$invoiceId';
}
