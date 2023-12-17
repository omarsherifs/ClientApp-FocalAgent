import 'package:client_app_focal_agent/features/home/data/data_sources/base_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/data/models/hr_employee_model.dart';
import 'package:client_app_focal_agent/features/home/data/models/it_employee_model.dart';

class RemoteEmployeesDataSource implements BaseEmployeesDataSource {
  @override
  Future<List<HrEmployeeModel>> getHrDepartmentEmployees() {
    // TODO: implement getHrDepartmentEmployees
    throw UnimplementedError();
  }

  @override
  Future<List<ItEmployeeModel>> getItDepartmentEmployees() {
    // TODO: implement getItDepartmentEmployees
    throw UnimplementedError();
  }
}
