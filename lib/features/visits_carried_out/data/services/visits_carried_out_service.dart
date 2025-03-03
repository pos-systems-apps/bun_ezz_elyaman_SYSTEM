import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/visits_carried_out/data/models/visit_list_carried_out_response.dart';
import 'package:pos_system/features/visits_carried_out/data/services/visits_carried_out_api_end_points.dart';

class VisitsCarriedOutService {
  ApiConsumer apiConsumer;

  VisitsCarriedOutService({required this.apiConsumer});

  Future<VisitListCarriedOutResponse> visitsCarriedOut() async {
    final response = await apiConsumer
        .get(VisitsCarriedOutApiEndPoints.visitsCarriedOutUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return VisitListCarriedOutResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
