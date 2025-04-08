import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/login/data/models/system_setting_response.dart';
import 'package:pos_system/features/login/data/models/update_user_location_request.dart';
import 'package:pos_system/features/login/data/models/user_setting_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../services/login_service.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<Either<Failure, SystemSettingResponse>> systemSetting() async {
    try {
      return Right(await _loginService.systemSetting());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, UserSettingResponse>> userSetting() async {
    try {
      return Right(await _loginService.userSetting());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel parameter) async {
    try {
      return Right(await _loginService.login(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> updateUseLocation(
      UpdateUserLocationRequest parameter) async {
    try {
      return Right(await _loginService.updateUseLocation(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
