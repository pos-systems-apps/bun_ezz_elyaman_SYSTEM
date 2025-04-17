import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/all_courses/data/models/all_courses_response_model.dart';
import 'package:pos_system/features/all_courses/data/models/complete_course_request.dart';
import 'package:pos_system/features/all_courses/data/services/all_courses_service.dart';

class DailyFingerprintManagementRepo {
  final AllCoursesService _allCoursesService;

  DailyFingerprintManagementRepo(this._allCoursesService);

  Future<Either<Failure, AllCoursesResponseModel>> getAllCourses() async {
    try {
      return Right(await _allCoursesService.getAllCourses());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> completeCourse(
      CompleteCourseRequest parameter) async {
    try {
      return Right(await _allCoursesService.completeCourse(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
