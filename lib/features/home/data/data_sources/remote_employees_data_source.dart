// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'package:client_app_focal_agent/core/network/api_caller.dart';
import 'package:client_app_focal_agent/features/home/data/data_sources/base_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/data/models/hr_employee_model.dart';
import 'package:client_app_focal_agent/features/home/data/models/it_employee_model.dart';

class RemoteEmployeesDataSource implements BaseEmployeesDataSource {
  @override
  Future<List<HrEmployeeModel>> getHrDepartmentEmployees() async {
    final list = <HrEmployeeModel>[];
    final response = await MockedApiCaller().getData(NetworkPaths.hrDataPath);
    final data = response.data;
    data.forEach((element) {
      list.add(HrEmployeeModel.fromJson(element as Map<String, dynamic>));
    });
    return list;
  }

  @override
  Future<List<ItEmployeeModel>> getItDepartmentEmployees() async {
    final list = <ItEmployeeModel>[];
    final response = await MockedApiCaller().getData(NetworkPaths.hrDataPath);
    final data = response.data;
    data.forEach((element) {
      list.add(ItEmployeeModel.fromJson(element as Map<String, dynamic>));
    });
    return list;
  }
}
