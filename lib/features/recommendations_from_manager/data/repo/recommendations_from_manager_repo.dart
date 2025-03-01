import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/all_courses/data/services/all_courses_service.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/recommendations_from_manager/data/services/recommendations_from_manager_service.dart';

class RecommendationsFromManagerRepo {
  final RecommendationsFromManagerService _recommendationsFromManagerService;

  RecommendationsFromManagerRepo(this._recommendationsFromManagerService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _recommendationsFromManagerService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
