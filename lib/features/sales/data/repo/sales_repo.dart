
import 'package:dartz/dartz.dart';
import 'package:pos_system/features/login/data/models/setting_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../services/sales_service.dart';

class SalesRepo {
  final SalesService _salesService;

  SalesRepo(this._salesService);

  Future<Either<Failure, SettingResponse>> appSetting() async {
    try {
      return Right(await _salesService.appSetting());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel parameter) async {
    try {
      return Right(await _salesService.login(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
