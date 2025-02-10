import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/confirm_collection_request_model.dart';
import '../services/collections_service.dart';

class CollectionsRepo {
  final CollectionsService _collectionsService;

  CollectionsRepo(this._collectionsService);

  Future<Either<Failure, SuccessResponseModel>> confirmCollection(
      ConfirmCollectionRequestModel parameter) async {
    try {
      return Right(await _collectionsService.confirmCollection(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
