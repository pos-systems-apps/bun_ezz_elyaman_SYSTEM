import 'package:dartz/dartz.dart';
import 'package:pos_system/features/splash/data/models/bank_accounts_response_model.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/users_response_model.dart';
import '../services/splash_service.dart';

class SplashRepo {
  final SplashService _splashService;

  SplashRepo(this._splashService);

  Future<Either<Failure, UsersResponseModel>> getUsers(String parameter) async {
    try {
      return Right(await _splashService.getUsers(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }  Future<Either<Failure, BankAccountsResponseModel>> getBankAccounts() async {
    try {
      return Right(await _splashService.getBankAccounts());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
