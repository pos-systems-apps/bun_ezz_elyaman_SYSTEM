import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/salary/data/models/get_salary_response_model.dart';
import 'package:pos_system/features/salary/data/services/salary_api_end_points.dart';

class SalaryService {
  ApiConsumer apiConsumer;

  SalaryService({required this.apiConsumer});

  Future<GetSalaryResponseModel> getSalary(String date) async {
    final response =
        await apiConsumer.get(SalaryApiEndPoints.getSalaryUrl(date), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return GetSalaryResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
