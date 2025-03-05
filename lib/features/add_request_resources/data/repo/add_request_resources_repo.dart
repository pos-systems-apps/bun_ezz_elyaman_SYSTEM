import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/add_request_resources/data/models/create_request_resources_request.dart';
import 'package:pos_system/features/add_request_resources/data/services/add_request_resources_service.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class AddRequestResourcesRepo {
  final AddRequestResourcesService _addRequestResourcesService;

  AddRequestResourcesRepo(this._addRequestResourcesService);

  Future<Either<Failure, SuccessResponseModel>> addRequestResources(
      CreateRequestResourcesRequest parameter) async {
    try {
      return Right(
          await _addRequestResourcesService.addRequestResources(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
