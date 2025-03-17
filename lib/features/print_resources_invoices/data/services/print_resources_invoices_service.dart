import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/print_resources_invoices/data/models/invoice_resources_response_model.dart';
import 'package:pos_system/features/print_resources_invoices/data/services/print_resources_invoices_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintResourcesInvoicesService {
  ApiConsumer apiConsumer;

  PrintResourcesInvoicesService({required this.apiConsumer});

  Future<InvoiceResourcesResponseModel> getResourcesInvoiceDetails(int invoiceId) async {

    final response = await apiConsumer
        .get(PrintResourcesInvoicesApiEndPoints.getResourcesInvoiceDetails( invoiceId), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return InvoiceResourcesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
