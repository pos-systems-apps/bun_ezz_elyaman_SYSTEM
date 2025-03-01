import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/all_courses/data/services/all_courses_service.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';

class AllCoursesRepo {
  final AllCoursesService _allCoursesService;

  AllCoursesRepo(this._allCoursesService);

  Future<Either<Failure, SuccessResponseModel>> createVisit(
      CreateVisitRequest parameter) async {
    try {
      return Right(await _allCoursesService.createVisit(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
