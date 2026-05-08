import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/print_invoice/data/services/print_invoice_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintInvoiceService {
  ApiConsumer apiConsumer;

  PrintInvoiceService({required this.apiConsumer});

  Future<InvoiceResponseModel> getInvoiceDetails(
      int type, int invoiceId) async {
    final response = await apiConsumer.get(
        type == 4
            ? PrintInvoiceApiEndPoints.getInvoiceDetails(invoiceId)
            : PrintInvoiceApiEndPoints.getInvoiceReturnsDetails(invoiceId),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == StatusCode.ok) {
      return InvoiceResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
