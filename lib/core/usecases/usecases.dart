import 'package:client_app_focal_agent/core/errors/error.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T> {
  Future<Either<T, AppError>> call();
}
