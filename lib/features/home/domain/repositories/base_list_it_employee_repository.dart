import 'package:client_app_focal_agent/core/errors/error.dart';
import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseListItEmployeeRepository {
  Future<Either<List<BaseEmployeeEntity>, AppError>> listEmployee();
}
