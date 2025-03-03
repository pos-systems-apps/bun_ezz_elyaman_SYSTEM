import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_request.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_response_model.dart';
import 'package:pos_system/features/fund_list/data/services/fund_list_api_end_points.dart';

class FundListService {
  ApiConsumer apiConsumer;

  FundListService({required this.apiConsumer});

  Future<FundListResponseModel> getFundList(FundListRequest parameter) async {
    final response = await apiConsumer.get(
        FundListApiEndPoints.getFundListUrl(parameter.from, parameter.to), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return FundListResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
