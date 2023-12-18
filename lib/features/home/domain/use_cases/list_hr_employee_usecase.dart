import 'package:client_app_focal_agent/core/errors/error.dart';
import 'package:client_app_focal_agent/core/usecases/usecases.dart';
import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';
import 'package:client_app_focal_agent/features/home/domain/repositories/base_list_hr_employee_repository.dart';
import 'package:dartz/dartz.dart';

class ListHrDepartmentEmployeesUseCase extends BaseUseCase<List<BaseEmployeeEntity>> {
  ListHrDepartmentEmployeesUseCase({
    required this.baseListHrEmployeeRepository,
  });
  BaseListHrEmployeeRepository baseListHrEmployeeRepository;

  @override
  Future<Either<List<BaseEmployeeEntity>, AppError>> call() async {
    return baseListHrEmployeeRepository.listEmployee();
  }
}
