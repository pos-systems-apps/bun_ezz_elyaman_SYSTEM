import 'dart:convert';

import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/status_code.dart';
import 'package:pos_system/core/exceptions/exceptions.dart';
import 'package:pos_system/core/exceptions/failure.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/transfers_section/data/models/transaction_section_response_model.dart';
import 'package:pos_system/features/transfers_section/data/services/transfer_section_api_end_points.dart';

class TransferSectionService {
  ApiConsumer apiConsumer;

  TransferSectionService({required this.apiConsumer});

  Future<List<TransactionSectionResponseModel>> getTransactionSection() async {
    final response = await apiConsumer
        .get(TransferSectionApiEndPoints.getTransactionSectionURl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return TransactionSectionResponseModel.fromJsonList(
          jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
