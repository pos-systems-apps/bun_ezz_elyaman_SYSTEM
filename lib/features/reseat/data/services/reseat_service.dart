import 'dart:convert';

import 'package:pos_system/features/login/data/models/setting_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'reseat_api_end_points.dart';

class ReseatService {
  ApiConsumer apiConsumer;

  ReseatService({required this.apiConsumer});

  Future<SettingResponse> appSetting() async {
    final response = await apiConsumer.get(ReseatApiEndPoints.appSettingUrl, null);
    if (response.statusCode == StatusCode.ok) {
      return SettingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

}
