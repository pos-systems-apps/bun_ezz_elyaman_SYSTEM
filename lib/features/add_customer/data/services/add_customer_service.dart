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
          nameAr: parameter.nameAr,
          nameEn: parameter.nameEn,
          regionId: parameter.regionId,
          mobile: parameter.mobile,
          typeId: parameter.typeId,
          numberTax: parameter.numberTax,
          commercialNumber: parameter.commercialNumber,
          email: parameter.email,
          city: parameter.city,
          countryCode: parameter.countryCode,
          address: parameter.address,
          image: parameter.image,
        ).toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
