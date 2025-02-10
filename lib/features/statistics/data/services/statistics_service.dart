import 'dart:convert';

import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'statistics_api_end_points.dart';

class StatisticsService {
  ApiConsumer apiConsumer;

  StatisticsService({required this.apiConsumer});

  Future<StatisticsResponseModel> getStatistics() async {
    String baseUrl = await getIt<EndPoints>().getBaseUrl();


    final response = await apiConsumer
        .get(StatisticsApiEndPoints.getStatisticsUrl(baseUrl), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return StatisticsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
