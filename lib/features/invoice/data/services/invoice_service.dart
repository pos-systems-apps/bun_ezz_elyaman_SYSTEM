import 'dart:convert';

import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import 'invoice_api_end_points.dart';

class InvoiceService {
  ApiConsumer apiConsumer;

  InvoiceService({required this.apiConsumer});

  Future<CategoryResponse> getCategories(int page) async {
    String baseUrl = await getIt<EndPoints>().getBaseUrl();

    final response = await apiConsumer
        .get(InvoiceApiEndPoints.getCategoriesUrl(baseUrl, page), {
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
      int categoryId,int type , int page) async {
    String baseUrl = await getIt<EndPoints>().getBaseUrl();

    final response = await apiConsumer.get(
        InvoiceApiEndPoints.getCategoryProductsUrl(baseUrl, categoryId,type, page), {
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
    String baseUrl = await getIt<EndPoints>().getBaseUrl();

    final response = await apiConsumer.get(
        InvoiceApiEndPoints.getSearchProductsUrl(baseUrl, name, type, page), {
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
}
