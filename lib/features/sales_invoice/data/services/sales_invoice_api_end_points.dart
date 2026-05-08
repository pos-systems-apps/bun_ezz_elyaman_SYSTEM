import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';

class SalesInvoiceApiEndPoints {
  static getInvoicesUrl() => '${EndPoints.baseUrl}api/delegate/orders';
  static getInvoicesReturnsUrl() => '${EndPoints.baseUrl}api/delegate/returns';
}
