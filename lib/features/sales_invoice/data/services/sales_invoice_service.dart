import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:pos_system/features/sales_invoice/data/services/sales_invoice_api_end_points.dart';

class SalesInvoiceService {
  ApiConsumer apiConsumer;

  SalesInvoiceService({required this.apiConsumer});

  Future<GetInvoicesResponseModel> getInvoices(int type) async {
    final response =
        await apiConsumer.get(SalesInvoiceApiEndPoints.getInvoicesUrl(type), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return GetInvoicesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
