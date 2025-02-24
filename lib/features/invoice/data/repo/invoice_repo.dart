import 'package:dartz/dartz.dart';
import 'package:pos_system/features/invoice/data/models/invoice_response_model.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../services/invoice_service.dart';

class InvoiceRepo {
  final InvoiceService _invoiceService;

  InvoiceRepo(this._invoiceService);

  Future<Either<Failure, InvoiceResponseModel>> getInvoiceDetails(
      int invoiceId) async {
    try {
      return Right(await _invoiceService.getInvoiceDetails(invoiceId));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
