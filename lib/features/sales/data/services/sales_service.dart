import 'dart:convert';

import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_order_response.dart';
import 'package:pos_system/features/sales/data/models/create_return_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_return_response.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'sales_api_end_points.dart';

class SalesService {
  ApiConsumer apiConsumer;

  SalesService({required this.apiConsumer});

  Future<CategoryResponse> getCategories(String type) async {
    final response = await apiConsumer.get(
        type == 's'
            ? SalesApiEndPoints.getCategoriesUrl
            : SalesApiEndPoints.getResourcesCategoriesUrl,
        {
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

  Future<TripProductsResponse> getCategoryProducts(
      String type, int categoryId, String search) async {
    final response = await apiConsumer.get(
        type == 's'
            ? SalesApiEndPoints.getCategoryProductsUrl(categoryId, search)
            : SalesApiEndPoints.getCategoryProductsResourcesUrl(categoryId, search),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
        });

    if (response.statusCode == StatusCode.ok) {
      return TripProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<CreateOrderResponseModel> createOrder(
      CreateOrderRequest parameter) async {
    final response = await apiConsumer.post(
      SalesApiEndPoints.createOrderURl,
      parameter.toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      return CreateOrderResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

  Future<CreateReturnResponseModel> createReturn(
    CreateReturnOrderRequest parameter,
  ) async {
    final response = await apiConsumer.post(
      SalesApiEndPoints.createReturnURl,
      CreateReturnOrderRequest(
        saleOrderId: parameter.saleOrderId,
        notes: parameter.notes,
        items: parameter.items,
      ).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      return CreateReturnResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
