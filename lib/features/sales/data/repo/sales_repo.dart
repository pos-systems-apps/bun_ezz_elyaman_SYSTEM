import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_order_response.dart';
import 'package:pos_system/features/sales/data/models/create_return_order_request.dart';
import 'package:pos_system/features/sales/data/models/create_return_response.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../services/sales_service.dart';

class SalesRepo {
  final SalesService _salesService;

  SalesRepo(this._salesService);

  Future<Either<Failure, CategoryResponse>> getCategories(String type) async {
    try {
      return Right(await _salesService.getCategories(type ));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, TripProductsResponse>> getCategoryProducts(
      String type,
      int categoryId,String search) async {
    try {
       return Right(
          await _salesService.getCategoryProducts(type,categoryId, search));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, CreateOrderResponseModel>> createOrder(
      CreateOrderRequest parameter) async {
    try {
      return Right(await _salesService.createOrder(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
  Future<Either<Failure, CreateReturnResponseModel>> createReturn(
      CreateReturnOrderRequest parameter) async {
    try {
      return Right(await _salesService.createReturn(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
