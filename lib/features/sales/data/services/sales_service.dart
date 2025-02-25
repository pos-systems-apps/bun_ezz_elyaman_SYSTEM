import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'sales_api_end_points.dart';

class SalesService {
  ApiConsumer apiConsumer;

  SalesService({required this.apiConsumer});

  Future<CategoryResponse> getCategories(int page) async {
    final response =
        await apiConsumer.get(SalesApiEndPoints.getCategoriesUrl(page), {
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
      int categoryId, int type, int page) async {
    final response = await apiConsumer
        .get(SalesApiEndPoints.getCategoryProductsUrl(categoryId, type, page), {
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

  Future<SearchProductsResponse> getSearchProducts(
      String name, int type, int page) async {
    final response = await apiConsumer
        .get(SalesApiEndPoints.getSearchProductsUrl(name, type, page), {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    if (response.statusCode == StatusCode.ok) {
      return SearchProductsResponse.fromJson(jsonDecode(response.body));
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
          totalTax: parameter.totalTax,
          extraDiscount: parameter.extraDiscount,
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
}
