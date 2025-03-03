import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/add_transfer_section/data/models/add_transfer_section_request.dart';
import 'package:pos_system/features/add_transfer_section/data/services/add_transfer_section_service.dart';

class AddTransferSectionRepo {
  final AddTransferSectionService _addTransferSectionService;

  AddTransferSectionRepo(this._addTransferSectionService);

  Future<Either<Failure, SuccessResponseModel>> addTransferSection(
      AddTransferSectionRequest parameter) async {
    try {
      return Right(await _addTransferSectionService.addTransferSection(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
