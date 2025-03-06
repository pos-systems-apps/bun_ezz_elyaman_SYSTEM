import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';
import 'package:pos_system/features/my_requests/data/services/my_requests_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class MyRequestsService {
  ApiConsumer apiConsumer;

  MyRequestsService({required this.apiConsumer});

  Future<AllRequestsResponse> getAllRequestsUrl(int type) async {
    final response =
        await apiConsumer.get(MyRequestsApiEndPoints.getAllRequestsUrl(type), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return AllRequestsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
