import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/all_courses/data/models/all_courses_response_model.dart';
import 'package:pos_system/features/all_courses/data/models/complete_course_request.dart';
import 'package:pos_system/features/all_courses/data/services/all_courses_api_end_points.dart';

class DailyFingerprintManagementService {
  ApiConsumer apiConsumer;

  DailyFingerprintManagementService({required this.apiConsumer});

  Future<AllCoursesResponseModel> getAllCourses() async {
    final response =
        await apiConsumer.get(AllCoursesApiEndPoints.getAllCoursesUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return AllCoursesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<SuccessResponseModel> completeCourse(
      CompleteCourseRequest parameter) async {
    final response = await apiConsumer.multiPost(
        AllCoursesApiEndPoints.completeCourseUrl,
        CompleteCourseRequest(
          courseId: parameter.courseId,
          images: parameter.images,
        ).toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
