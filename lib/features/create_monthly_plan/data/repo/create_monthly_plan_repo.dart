// import 'package:dartz/dartz.dart';
// import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
// import 'package:pos_system/core/exceptions/exceptions.dart';
// import 'package:pos_system/core/exceptions/failure.dart';
// import 'package:pos_system/features/create_monthly_plan/data/models/create_monthly_plan_request.dart';
// import 'package:pos_system/features/create_monthly_plan/data/services/create_monthly_plan_service.dart';
//
// class CreateMonthlyPlanRepo {
//   final CreateMonthlyPlanService _createMonthlyPlanService;
//
//   CreateMonthlyPlanRepo(this._createMonthlyPlanService);
//
//   Future<Either<Failure, SuccessResponseModel>> createMonthlyPlan(
//       CreateMonthlyPlanRequest parameter) async {
//     try {
//       return Right(await _createMonthlyPlanService.createMonthlyPlan(parameter));
//     } on ServerException catch (failure) {
//       return Left(ServerFailure(message: failure.serverFailure.message));
//     }
//   }
// }
