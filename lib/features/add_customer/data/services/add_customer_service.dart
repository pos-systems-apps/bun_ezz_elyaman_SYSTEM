import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/add_customer/data/models/add_customer_request.dart';
import 'package:pos_system/features/add_customer/data/services/add_customer_api_end_points.dart';

class AddCustomerService {
  ApiConsumer apiConsumer;

  AddCustomerService({required this.apiConsumer});

  Future<SuccessResponseModel> addCustomer(AddCustomerRequest parameter) async {
    final response = await apiConsumer.multiPost(
        AddCustomerApiEndPoints.addCustomerURl,
        AddCustomerRequest(
          name: parameter.name,
          mobile: parameter.mobile,
          email: parameter.email,
           address: parameter.address,
         ).toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    if (response.statusCode == StatusCode.created) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
