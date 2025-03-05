import 'package:dartz/dartz.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/features/salary/data/models/get_salary_response_model.dart';
import 'package:pos_system/features/salary/data/services/salary_service.dart';

class SalaryRepo {
  final SalaryService _salaryService;

  SalaryRepo(this._salaryService);

  Future<Either<Failure, GetSalaryResponseModel>> getSalary(String date) async {
    try {
      return Right(await _salaryService.getSalary(date));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
