import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/visits_carried_out/data/models/visit_list_carried_out_response.dart';
import 'package:pos_system/features/visits_carried_out/data/services/visits_carried_out_service.dart';

class VisitsCarriedOutRepo {
  final VisitsCarriedOutService _visitsCarriedOutService;

  VisitsCarriedOutRepo(this._visitsCarriedOutService);

  Future<Either<Failure, VisitListCarriedOutResponse>> visitsCarriedOut() async {
    try {
      return Right(await _visitsCarriedOutService.visitsCarriedOut());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
