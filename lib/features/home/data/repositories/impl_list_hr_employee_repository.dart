import 'package:client_app_focal_agent/core/errors/error.dart';
import 'package:client_app_focal_agent/features/home/data/data_sources/base_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';
import 'package:client_app_focal_agent/features/home/domain/repositories/base_list_hr_employee_repository.dart';
import 'package:dartz/dartz.dart';

class ImplListHrEmployeeRepository implements BaseListHrEmployeeRepository {
  ImplListHrEmployeeRepository(this._baseEmployeesDataSource);
  BaseEmployeesDataSource _baseEmployeesDataSource;
  @override
  Future<Either<List<BaseEmployeeEntity>, AppError>> listEmployee() async {
    try {
      return Left(await _baseEmployeesDataSource.getHrDepartmentEmployees());
    } on Exception catch (ex) {
      return Right(AppError(ex.toString()));
    }
  }
}
