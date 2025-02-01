import 'dart:convert';

import 'package:pos_system/features/login/data/models/setting_response.dart';

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

  Future<SettingResponse> appSetting() async {
    final response = await apiConsumer.get(LoginApiEndPoints.appSettingUrl, null);
    if (response.statusCode == StatusCode.ok) {
      return SettingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<LoginResponseModel> login(LoginRequestModel parameter) async {
    final response = await apiConsumer.post(
        LoginApiEndPoints.loginUrl,
        LoginRequestModel(code: parameter.code, password: parameter.password)
            .toJson(),
        null);
    if (response.statusCode == StatusCode.ok) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

// Future<LoginResponseModel> loginWithGoogle(
//     LoginWithSocialRequestModel parameter) async {
//   final response = await apiConsumer.post(
//       LoginApiEndPoints.loginWithSocialUrl,
//       LoginWithSocialRequestModel(
//               provider: parameter.provider,
//               accessToken: parameter.accessToken)
//           .toJson(),
//       null);
//   if (jsonDecode(response.body)['status'] == true) {
//     return LoginResponseModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw ServerException(
//         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
//   }
// }

// Future<LoginResponseModel> loginWithApple(
//     LoginWithAppleRequestModel parameter) async {
//   final response = await apiConsumer.post(
//       LoginApiEndPoints.loginWithAppleUrl,
//       LoginWithAppleRequestModel(
//         provider: parameter.provider,
//         tokenId: parameter.tokenId,
//         name: parameter.name,
//         email: parameter.email,
//       ).toJson(),
//       null);
//   if (jsonDecode(response.body)['status'] == true) {
//     return LoginResponseModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw ServerException(
//         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
//   }
// }

// Future<SuccessResponseModel> sendFCM(FcmRequestModel parameter) async {
//   final response = await apiConsumer.post(
//       LoginApiEndPoints.sendFCMUrl,
//       FcmRequestModel(
//         token: parameter.token,
//       ).toJson(),
//       {
//         ConstantKeys.appAuthorization:
//         "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
//       });
//   if (response.statusCode == 200) {
//     return SuccessResponseModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw ServerException(
//         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
//   }
// }
}
