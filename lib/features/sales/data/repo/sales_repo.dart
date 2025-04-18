import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_return_order_request.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../services/sales_service.dart';

class SalesRepo {
  final SalesService _salesService;

  SalesRepo(this._salesService);

  Future<Either<Failure, CategoryResponse>> getCategories(int page) async {
    try {
      return Right(await _salesService.getCategories(page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, CategoryProductsResponse>> getCategoryProducts(
      int categoryId, int? type, int page) async {
    try {
      return Right(
          await _salesService.getCategoryProducts(categoryId, type, page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SearchProductsResponse>> getSearchProducts(
      String name, int? type) async {
    try {
      return Right(await _salesService.getSearchProducts(name, type));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> createOrder(
      CreateOrderRequest parameter) async {
    try {
      return Right(await _salesService.createOrder(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
  Future<Either<Failure, SuccessResponseModel>> createReturn(
      CreateReturnOrderRequest parameter) async {
    try {
      return Right(await _salesService.createReturn(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
