import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/required_visits_list/data/models/required_visit_list_response.dart';
import 'package:pos_system/features/required_visits_list/data/services/required_visits_list_api_end_points.dart';

class RequiredVisitsListService {
  ApiConsumer apiConsumer;

  RequiredVisitsListService({required this.apiConsumer});

  Future<RequiredVisitListResponse> requiredVisitsList() async {
    final response = await apiConsumer.get(
        RequiredVisitsListApiEndPoints.requiredVisitsListUrl,
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    if (response.statusCode == StatusCode.ok) {
      return RequiredVisitListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
