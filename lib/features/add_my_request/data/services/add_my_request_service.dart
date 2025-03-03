import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/add_my_request/data/models/add_my_request_request.dart';
import 'package:pos_system/features/add_my_request/data/services/add_my_request_api_end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class AddMyRequestService {
  ApiConsumer apiConsumer;

  AddMyRequestService({required this.apiConsumer});

  Future<SuccessResponseModel> addMyRequest(
      AddMyRequestRequest parameter) async {
    final response = await apiConsumer.post(
        AddMyRequestApiEndPoints.addMyRequestUrl,
        AddMyRequestRequest(
                type: parameter.type,
                note: parameter.note,
                date: parameter.date)
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

// Future<SuccessResponseModel> createOrder(CreateOrderRequest parameter) async {
//   final response = await apiConsumer.multiPost(
//       MyRequestsApiEndPoints.createOrderURl,
//       CreateOrderRequest(
//         userId: parameter.userId,
//         img: parameter.img,
//         totalTax: parameter.totalTax,
//         extraDiscount: parameter.extraDiscount,
//         collectedCash: parameter.collectedCash,
//         orderType: parameter.orderType,
//         finalOrderAmount: parameter.finalOrderAmount,
//         cash: parameter.cash,
//         carts: parameter.carts,
//       ).toJson(),
//       {
//         ConstantKeys.appAuthorization:
//             "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
//       });
//   if (response.statusCode == StatusCode.ok) {
//     return SuccessResponseModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw ServerException(
//         serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
//   }
// }
}
