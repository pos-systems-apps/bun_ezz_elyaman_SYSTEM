import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/cash_invoice/data/models/cash_invoices_response_model.dart';
import 'package:pos_system/features/cash_invoice/data/services/cash_invoice_service.dart';

class CashInvoiceRepo {
  final CashInvoiceService _cashInvoiceService;

  CashInvoiceRepo(this._cashInvoiceService);

  Future<Either<Failure, CashInvoicesResponseModel>> getCashInvoice() async {
    try {
      return Right(await _cashInvoiceService.getCashInvoice());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
