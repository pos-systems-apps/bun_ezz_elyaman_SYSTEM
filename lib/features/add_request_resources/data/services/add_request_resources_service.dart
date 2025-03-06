import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/add_request_resources/data/models/create_request_resources_request.dart';
import 'package:pos_system/features/add_request_resources/data/services/add_request_resources_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class AddRequestResourcesService {
  ApiConsumer apiConsumer;

  AddRequestResourcesService({required this.apiConsumer});

  Future<SuccessResponseModel> addRequestResources(
      CreateRequestResourcesRequest parameter) async {
    final response = await apiConsumer.post(
        AddRequestResourcesApiEndPoints.addRequestResourcesURl,
        CreateRequestResourcesRequest(
          type: parameter.type,
          resourceItems: parameter.resourceItems,
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
