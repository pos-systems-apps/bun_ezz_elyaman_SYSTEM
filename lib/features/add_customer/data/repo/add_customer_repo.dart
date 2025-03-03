import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/add_customer/data/models/add_customer_request.dart';
import 'package:pos_system/features/add_customer/data/services/add_customer_service.dart';

class AddCustomerRepo {
  final AddCustomerService _addCustomerService;

  AddCustomerRepo(this._addCustomerService);

  Future<Either<Failure, SuccessResponseModel>> addCustomer(
      AddCustomerRequest parameter) async {
    try {
      return Right(await _addCustomerService.addCustomer(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
