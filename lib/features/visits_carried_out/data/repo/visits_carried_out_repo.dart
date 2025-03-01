import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/create_visit/data/services/create_visit_service.dart';
import 'package:pos_system/features/fund_list/data/services/fund_list_service.dart';
import 'package:pos_system/features/visits_carried_out/data/services/visits_carried_out_service.dart';

class VisitsCarriedOutRepo {
  final VisitsCarriedOutService _visitsCarriedOutService;

  VisitsCarriedOutRepo(this._visitsCarriedOutService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _visitsCarriedOutService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
