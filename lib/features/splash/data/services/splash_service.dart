import 'dart:convert';

import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/splash/data/models/bank_accounts_response_model.dart';
import 'package:pos_system/features/splash/data/models/categories_and_regions_response.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'splash_api_end_points.dart';

class SplashService {
  ApiConsumer apiConsumer;

  SplashService({required this.apiConsumer});

  Future<UsersResponseModel> getUsers(String parameter) async {

    final response =
        await apiConsumer.get(SplashApiEndPoints.getUsersUrl(parameter), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return UsersResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<BankAccountsResponseModel> getBankAccounts() async {
    final response =
        await apiConsumer.get(SplashApiEndPoints.getBankAccountsUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });

    if (response.statusCode == StatusCode.ok) {
      return BankAccountsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<CategoriesAndRegionsResponse> getCategoriesAndRegions() async {
    final response =
        await apiConsumer.get(SplashApiEndPoints.getCategoriesAndRegionsUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return CategoriesAndRegionsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}