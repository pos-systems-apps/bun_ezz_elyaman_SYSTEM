import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_request.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_response_model.dart';
import 'package:pos_system/features/fund_list/data/services/fund_list_service.dart';

class FundListRepo {
  final FundListService _fundListService;

  FundListRepo(this._fundListService);

  Future<Either<Failure, FundListResponseModel>> getFundList(
      FundListRequest parameter) async {
    try {
      return Right(await _fundListService.getFundList(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
