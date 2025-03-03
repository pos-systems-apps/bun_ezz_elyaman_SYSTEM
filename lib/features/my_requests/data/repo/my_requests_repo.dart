import 'package:dartz/dartz.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';
import 'package:pos_system/features/my_requests/data/services/my_requests_service.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class MyRequestsRepo {
  final MyRequestsService _myRequestsService;

  MyRequestsRepo(this._myRequestsService);

  Future<Either<Failure, AllRequestsResponse>> getAllRequestsUrl(int type) async {
    try {
      return Right(await _myRequestsService.getAllRequestsUrl(type));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  //
  // Future<Either<Failure, SuccessResponseModel>> createOrder(
  //     CreateOrderRequest parameter) async {
  //   try {
  //     return Right(await _myRequestsService.createOrder(parameter));
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(message: failure.serverFailure.message));
  //   }
  // }
}
