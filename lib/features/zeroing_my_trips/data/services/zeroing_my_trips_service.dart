import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/zeroing_my_trips/data/models/zeroing_my_trips_request_model.dart';
import 'package:pos_system/features/zeroing_my_trips/data/services/zeroing_my_trips_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class ZeroingMyTripsService {
  ApiConsumer apiConsumer;

  ZeroingMyTripsService({required this.apiConsumer});

  Future<SuccessResponseModel> zeroingMyTrips(
      ZeroingMyTripsRequestModel parameter) async {
    final response = await apiConsumer.post(
        ZeroingMyTripsApiEndPoints.zeroingMyTripsUrl,
        ZeroingMyTripsRequestModel(
                email: parameter.email, password: parameter.password)
            .toJson(),
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
