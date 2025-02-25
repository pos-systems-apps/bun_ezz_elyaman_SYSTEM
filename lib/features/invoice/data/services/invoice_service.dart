import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/invoice/data/models/invoice_response_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'invoice_api_end_points.dart';

class InvoiceService {
  ApiConsumer apiConsumer;

  InvoiceService({required this.apiConsumer});

  Future<InvoiceResponseModel> getInvoiceDetails(int invoiceId) async {

    final response = await apiConsumer
        .get(InvoiceApiEndPoints.getInvoiceDetails( invoiceId), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return InvoiceResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
