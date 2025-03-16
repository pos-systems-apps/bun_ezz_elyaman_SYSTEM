import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/print_cash_invoice/data/models/invoice_cash_response_model.dart';
import 'package:pos_system/features/print_cash_invoice/data/services/print_cash_invoice_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintCashInvoiceService {
  ApiConsumer apiConsumer;

  PrintCashInvoiceService({required this.apiConsumer});

  Future<InvoiceCashResponseModel> getCashInvoiceDetails(
      int instalmentID) async {
    final response = await apiConsumer.get(
        PrintCashInvoiceApiEndPoints.getCashInvoiceDetailsUrl(instalmentID), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return InvoiceCashResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
