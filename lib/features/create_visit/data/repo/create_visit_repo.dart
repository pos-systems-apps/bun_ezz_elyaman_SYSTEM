import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/create_visit/data/services/create_visit_service.dart';

class CreateVisitRepo {
  final CreateVisitService _createVisitService;

  CreateVisitRepo(this._createVisitService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _createVisitService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
