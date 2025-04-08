import 'package:dartz/dartz.dart';
import 'package:pos_system/features/print_resources_invoices/data/models/invoice_resources_response_model.dart';
import 'package:pos_system/features/print_resources_invoices/data/services/print_resources_invoices_service.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class PrintResourcesInvoicesRepo {
  final PrintResourcesInvoicesService _printResourcesInvoicesService;

  PrintResourcesInvoicesRepo(this._printResourcesInvoicesService);

  Future<Either<Failure, InvoiceResourcesResponseModel>> getResourcesInvoiceDetails(
      int invoiceId) async {
    try {
      return Right(await _printResourcesInvoicesService.getResourcesInvoiceDetails(invoiceId));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
