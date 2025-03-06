import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/cash_invoice/data/models/cash_invoices_response_model.dart';
import 'package:pos_system/features/cash_invoice/data/services/cash_invoice_api_end_points.dart';

class CashInvoiceService {
  ApiConsumer apiConsumer;

  CashInvoiceService({required this.apiConsumer});

  Future<CashInvoicesResponseModel> getCashInvoice() async {
    final response =
        await apiConsumer.get(CashInvoiceApiEndPoints.getCashInvoiceUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return CashInvoicesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
