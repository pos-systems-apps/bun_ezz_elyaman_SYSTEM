import 'package:dartz/dartz.dart';
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/print_invoice/data/services/print_invoice_service.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintInvoiceRepo {
  final PrintInvoiceService _printInvoiceService;

  PrintInvoiceRepo(this._printInvoiceService);

  Future<Either<Failure, InvoiceResponseModel>> getInvoiceDetails(
      int invoiceId) async {
    try {
      return Right(await _printInvoiceService.getInvoiceDetails(invoiceId));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}

