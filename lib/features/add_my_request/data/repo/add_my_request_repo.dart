import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/add_my_request/data/models/add_my_request_request.dart';
import 'package:pos_system/features/add_my_request/data/services/add_my_request_service.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class AddMyRequestRepo {
  final AddMyRequestService _addMyRequestService;

  AddMyRequestRepo(this._addMyRequestService);

  Future<Either<Failure, SuccessResponseModel>> addMyRequest(AddMyRequestRequest parameter) async {
    try {
      return Right(await _addMyRequestService.addMyRequest(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }


}
