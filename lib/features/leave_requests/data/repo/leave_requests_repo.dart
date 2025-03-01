import 'package:dartz/dartz.dart';
import 'package:pos_system/core/errors_and_success_response/success/success_response.dart';
import 'package:pos_system/features/leave_requests/data/services/leave_requests_service.dart';
import 'package:pos_system/features/my_requests/data/services/my_requests_service.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';

class LeaveRequestsRepo {
  final LeaveRequestsService _leaveRequestsService;

  LeaveRequestsRepo(this._leaveRequestsService);

  Future<Either<Failure, CategoryResponse>> getCategories(int page) async {
    try {
      return Right(await _leaveRequestsService.getCategories(page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, CategoryProductsResponse>> getCategoryProducts(
      int categoryId, int type, int page) async {
    try {
      return Right(
          await _leaveRequestsService.getCategoryProducts(categoryId, type, page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SearchProductsResponse>> getSearchProducts(
      String name, int type, int page) async {
    try {
      return Right(await _leaveRequestsService.getSearchProducts(name, type, page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> createOrder(
      CreateOrderRequest parameter) async {
    try {
      return Right(await _leaveRequestsService.createOrder(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
