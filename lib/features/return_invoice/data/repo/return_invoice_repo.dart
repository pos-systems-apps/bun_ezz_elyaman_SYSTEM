import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/return_invoice/data/services/return_invoice_service.dart';

class ReturnInvoiceRepo {
  final ReturnInvoiceService _returnInvoiceService;

  ReturnInvoiceRepo(this._returnInvoiceService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _returnInvoiceService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
