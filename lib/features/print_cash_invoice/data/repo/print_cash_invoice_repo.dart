import 'package:dartz/dartz.dart';
import 'package:pos_system/features/print_cash_invoice/data/models/invoice_cash_response_model.dart';
import 'package:pos_system/features/print_cash_invoice/data/services/print_cash_invoice_service.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintCashInvoiceRepo {
  final PrintCashInvoiceService _printCashInvoiceService;

  PrintCashInvoiceRepo(this._printCashInvoiceService);

  Future<Either<Failure, InvoiceCashResponseModel>> getCashInvoiceDetails(
      int instalmentID) async {
    try {
      return Right(await _printCashInvoiceService.getCashInvoiceDetails(instalmentID));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
