import 'package:dartz/dartz.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/data/models/search_products_response.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../services/invoice_service.dart';

class InvoiceRepo {
  final InvoiceService _invoiceService;

  InvoiceRepo(this._invoiceService);

  Future<Either<Failure, CategoryResponse>> getCategories(int page) async {
    try {
      return Right(await _invoiceService.getCategories(page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, CategoryProductsResponse>> getCategoryProducts(
      int categoryId,int type ,int page) async {
    try {
      return Right(await _invoiceService.getCategoryProducts(categoryId, type,page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SearchProductsResponse>> getSearchProducts(
      String name, int type, int page) async {
    try {
      return Right(await _invoiceService.getSearchProducts(name, type, page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
