import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/confirm_collection_request_model.dart';
import '../models/confirm_collection_response_model.dart';
import '../services/collections_service.dart';

class CollectionsRepo {
  final CollectionsService _collectionsService;

  CollectionsRepo(this._collectionsService);

  Future<Either<Failure, ConfirmCollectionResponseModel>> confirmCollection(
      ConfirmCollectionRequestModel parameter) async {
    try {
      return Right(await _collectionsService.confirmCollection(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
