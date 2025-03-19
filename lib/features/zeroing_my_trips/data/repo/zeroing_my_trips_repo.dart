import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/zeroing_my_trips/data/models/zeroing_my_trips_request_model.dart';
import 'package:pos_system/features/zeroing_my_trips/data/services/zeroing_my_trips_service.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class ZeroingMyTripsRepo {
  final ZeroingMyTripsService _zeroingMyTripsService;

  ZeroingMyTripsRepo(this._zeroingMyTripsService);

  Future<Either<Failure, SuccessResponseModel>> zeroingMyTrips(
      ZeroingMyTripsRequestModel parameter) async {
    try {
      return Right(await _zeroingMyTripsService.zeroingMyTrips(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
