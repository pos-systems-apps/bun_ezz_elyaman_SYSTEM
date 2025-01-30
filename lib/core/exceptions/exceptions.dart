
import 'package:pos_system/core/exceptions/failure.dart';

class ServerException implements Exception {
  final ServerFailure serverFailure;

  const ServerException({required this.serverFailure});
}
