import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/visits_list/data/services/visits_list_service.dart';

class VisitsListRepo {
  final VisitsListService _visitsListService;

  VisitsListRepo(this._visitsListService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _visitsListService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
