import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/login/data/models/system_setting_response.dart';
import 'package:pos_system/features/login/data/models/update_user_location_request.dart';
import 'package:pos_system/features/login/data/models/user_setting_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import 'login_api_end_points.dart';

class LoginService {
  ApiConsumer apiConsumer;

  LoginService({required this.apiConsumer});

  // Future<SystemSettingResponse> systemSetting() async {
  //   final response = await apiConsumer.get(LoginApiEndPoints.systemSettingUrl, null);
  //   if (response.statusCode == StatusCode.ok) {
  //     return SystemSettingResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw ServerException(
  //         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
  //   }
  // }
  // Future<UserSettingResponse> userSetting() async {
  //   final response = await apiConsumer.get(LoginApiEndPoints.userSettingUrl, {
  //     ConstantKeys.appAuthorization:
  //     "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
  //   });
  //   if (response.statusCode == StatusCode.ok) {
  //     return UserSettingResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw ServerException(
  //         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
  //   }
  // }

  Future<LoginResponseModel> login(LoginRequestModel parameter) async {
     final response = await apiConsumer.post(
        LoginApiEndPoints.loginUrl,
        LoginRequestModel(email: parameter.email, password: parameter.password)
            .toJson(),
        null);

    if (response.statusCode == StatusCode.ok) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
  Future<SuccessResponseModel> logOut() async {
     final response = await apiConsumer.post(
        LoginApiEndPoints.logOutUrl,
        null,
         {
           ConstantKeys.appAuthorization:
           "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
         });

    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<SuccessResponseModel> updateUseLocation(UpdateUserLocationRequest parameter) async {
    final response = await apiConsumer.post(
        LoginApiEndPoints.updateUserLocationUrl,
        UpdateUserLocationRequest(latitude: parameter.latitude, longitude: parameter.longitude)
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
