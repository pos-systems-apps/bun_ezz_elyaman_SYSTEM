import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/request_resources_invoices/data/models/get_resources_invoices_response_model.dart';
import 'package:pos_system/features/request_resources_invoices/data/services/request_resources_invoices_api_end_points.dart';

class RequestResourcesInvoicesService {
  ApiConsumer apiConsumer;

  RequestResourcesInvoicesService({required this.apiConsumer});

  Future<GetResourcesInvoicesResponseModel> getRequestResourcesInvoices(int type) async {
    final response =
        await apiConsumer.get(RequestResourcesInvoicesApiEndPoints.getRequestResourcesInvoicesUrl(type), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return GetResourcesInvoicesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
