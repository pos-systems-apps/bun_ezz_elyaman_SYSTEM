import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/request_resources_invoices/data/models/get_resources_invoices_response_model.dart';
import 'package:pos_system/features/request_resources_invoices/data/services/request_resources_invoices_service.dart';

class RequestResourcesInvoicesRepo {
  final RequestResourcesInvoicesService _requestResourcesInvoicesService;

  RequestResourcesInvoicesRepo(this._requestResourcesInvoicesService);

  Future<Either<Failure, GetResourcesInvoicesResponseModel>>
      getRequestResourcesInvoices(int type) async {
    try {
      return Right(await _requestResourcesInvoicesService.getRequestResourcesInvoices(type));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
