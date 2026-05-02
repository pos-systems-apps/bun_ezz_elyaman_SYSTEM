import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_constant.dart';


class PrintResourcesInvoicesApiEndPoints {
  static getResourcesInvoiceDetails(int installmentID) =>
      '${EndPoints.baseUrl}api/v1/product/reservation/invoice/$installmentID';
}
