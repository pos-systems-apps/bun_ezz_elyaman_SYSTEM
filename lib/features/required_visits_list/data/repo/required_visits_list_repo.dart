import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/required_visits_list/data/models/required_visit_list_response.dart';
import 'package:pos_system/features/required_visits_list/data/services/required_visits_list_service.dart';

class RequiredVisitsListRepo {
  final RequiredVisitsListService _requiredVisitsListService;

  RequiredVisitsListRepo(this._requiredVisitsListService);

  Future<Either<Failure, RequiredVisitListResponse>> requiredVisitsList() async {
    try {
      return Right(await _requiredVisitsListService.requiredVisitsList());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
