import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_return_order_request.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'sales_api_end_points.dart';

class SalesService {
  ApiConsumer apiConsumer;

  SalesService({required this.apiConsumer});

  Future<CategoryResponse> getCategories() async {
    final response = await apiConsumer.get(SalesApiEndPoints.getCategoriesUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return CategoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<CategoryProductsResponse> getCategoryProducts(
      int categoryId, String search) async {
    final response = await apiConsumer
        .get(SalesApiEndPoints.getCategoryProductsUrl(categoryId, search), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });

    if (response.statusCode == StatusCode.ok) {
      return CategoryProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<SuccessResponseModel> createOrder(CreateOrderRequest parameter) async {
    final response = await apiConsumer.multiPost(
        SalesApiEndPoints.createOrderURl,
        CreateOrderRequest(
          userId: parameter.userId,
          img: parameter.img,
          allOrderAmount: parameter.allOrderAmount,
          totalTax: parameter.totalTax,
          extraDiscount: parameter.extraDiscount,
          totalProductsDiscount: parameter.totalProductsDiscount,
          collectedCash: parameter.collectedCash,
          orderType: parameter.orderType,
          finalOrderAmount: parameter.finalOrderAmount,
          cash: parameter.cash,
          carts: parameter.carts,
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

  Future<SuccessResponseModel> createReturn(
      CreateReturnOrderRequest parameter) async {
    final response = await apiConsumer.post(
        SalesApiEndPoints.createReturnURl,
        CreateReturnOrderRequest(
          orderId: parameter.orderId,
          returnQuantitiesHidden: parameter.returnQuantitiesHidden,
          returnUnitHidden: parameter.returnUnitHidden,
          date: parameter.date,
        ).toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
