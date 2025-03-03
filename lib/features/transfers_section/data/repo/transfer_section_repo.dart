import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/transfers_section/data/models/transaction_section_response_model.dart';
import 'package:pos_system/features/transfers_section/data/services/transfer_section_service.dart';

class TransferSectionRepo {
  final TransferSectionService _transferSectionService;

  TransferSectionRepo(this._transferSectionService);

  Future<Either<Failure, List<TransactionSectionResponseModel>>>
  getTransactionSection() async {
    try {
      return Right(await _transferSectionService.getTransactionSection());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
