import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/add_customer/data/services/add_customer_api_end_points.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';

class AddCustomerService {
  ApiConsumer apiConsumer;

  AddCustomerService({required this.apiConsumer});

  Future<SuccessResponseModel> addCustomer(
      CreateVisitRequest parameter) async {
    final response = await apiConsumer.post(
        AddCustomerApiEndPoints.addCustomerURl,
        CreateVisitRequest(
                customerId: parameter.customerId, note: parameter.note)
            .toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
