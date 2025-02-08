
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/statistics_response_model.dart';
import '../services/statistics_service.dart';

class StatisticsRepo {
  final StatisticsService _statisticsService;

  StatisticsRepo(this._statisticsService);

  Future<Either<Failure, StatisticsResponseModel>> getStatistics() async {
    try {
      return Right(await _statisticsService.getStatistics());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}


