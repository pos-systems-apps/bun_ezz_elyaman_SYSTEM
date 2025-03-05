import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:pos_system/features/sales_invoice/data/services/sales_invoice_service.dart';

class SalesInvoiceRepo {
  final SalesInvoiceService _salesInvoiceService;

  SalesInvoiceRepo(this._salesInvoiceService);

  Future<Either<Failure, GetInvoicesResponseModel>> getInvoices(
      int type) async {
    try {
      return Right(await _salesInvoiceService.getInvoices(type));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
