import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/transfers_section/data/services/transfer_section_service.dart';

class TransferSectionRepo {
  final TransferSectionService _transferSectionService;

  TransferSectionRepo(this._transferSectionService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _transferSectionService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
