// import 'dart:convert';
//
// import 'package:pos_system/core/api/api_consumer.dart';
// import 'package:pos_system/core/api/status_code.dart';
// import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
// import 'package:pos_system/core/exceptions/exceptions.dart';
// import 'package:pos_system/core/exceptions/failure.dart';
// import 'package:pos_system/core/services/cache_helper.dart';
// import 'package:pos_system/core/utils/constant_keys.dart';
// import 'package:pos_system/features/create_monthly_plan/data/models/create_monthly_plan_request.dart';
// import 'package:pos_system/features/create_monthly_plan/data/services/create_monthly_plan_api_end_points.dart';
//
// class CreateMonthlyPlanService {
//   ApiConsumer apiConsumer;
//
//   CreateMonthlyPlanService({required this.apiConsumer});
//
//   Future<SuccessResponseModel> createMonthlyPlan(
//       CreateMonthlyPlanRequest parameter) async {
//     final response = await apiConsumer.post(
//         CreateMonthlyPlanApiEndPoints.createMonthlyPlanURl,
//         CreateMonthlyPlanRequest(
//           note: parameter.note,
//           date: parameter.date,
//           customerId: parameter.customerId,
//         ).toJson(),
//         {
//           ConstantKeys.appAuthorization:
//               "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
//         });
//     if (response.statusCode == StatusCode.ok) {
//       return SuccessResponseModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw ServerException(
//           serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
//     }
//   }
// }
