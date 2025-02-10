import 'dart:convert';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/confirm_collection_request_model.dart';
import 'collections_api_end_points.dart';

class CollectionsService {
  ApiConsumer apiConsumer;

  CollectionsService({required this.apiConsumer});

  Future<SuccessResponseModel> confirmCollection(
      ConfirmCollectionRequestModel parameter) async {
    String baseUrl = await getIt<EndPoints>().getBaseUrl();
    final response = await apiConsumer.multiPost(
        CollectionsApiEndPoints.confirmCollection(baseUrl),
        ConfirmCollectionRequestModel(
          billID: parameter.billID,
          bankAccountID: parameter.bankAccountID,
          paymentWayID: parameter.paymentWayID,
          customerID: parameter.customerID,
          price: parameter.price,
          noteText: parameter.noteText,
          image: parameter.image,
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
