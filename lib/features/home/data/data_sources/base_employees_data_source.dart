import 'package:client_app_focal_agent/features/home/data/models/hr_employee_model.dart';
import 'package:client_app_focal_agent/features/home/data/models/it_employee_model.dart';

abstract class BaseEmployeesDataSource {
  Future<List<HrEmployeeModel>> getHrDepartmentEmployees();
  Future<List<ItEmployeeModel>> getItDepartmentEmployees();
}
