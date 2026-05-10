import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class PrintCashInvoiceApiEndPoints {
  static getCashInvoiceDetailsUrl(int instalmentID) =>
      '${EndPoints.baseUrl}api/delegate/collections/$instalmentID';
}
