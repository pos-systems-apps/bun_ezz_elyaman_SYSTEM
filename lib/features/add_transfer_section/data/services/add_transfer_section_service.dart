import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/add_transfer_section/data/models/add_transfer_section_request.dart';
import 'package:pos_system/features/add_transfer_section/data/services/add_transfer_section_api_end_points.dart';

class AddTransferSectionService {
  ApiConsumer apiConsumer;

  AddTransferSectionService({required this.apiConsumer});

  Future<SuccessResponseModel> addTransferSection(
      AddTransferSectionRequest parameter) async {
    final response = await apiConsumer.multiPost(
        AddTransferSectionApiEndPoints.addTransferSectionUrl,
        AddTransferSectionRequest(
                bankAccountId: parameter.bankAccountId,
                amount: parameter.amount,
                note: parameter.note,
                image: parameter.image)
            .toJson(),
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
