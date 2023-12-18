// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:convert';

import 'package:client_app_focal_agent/features/home/data/data_sources/base_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/data/models/hr_employee_model.dart';
import 'package:client_app_focal_agent/features/home/data/models/it_employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedEmployeesDataSource implements BaseEmployeesDataSource {
  @override
  Future<List<HrEmployeeModel>> getHrDepartmentEmployees() async {
    final list = <HrEmployeeModel>[];
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(SharedPreferencesKeys.hrCachedDataKey);
    if (data != null) {
      final result = json.decode(data);
      result.forEach((element) {
        list.add(HrEmployeeModel.fromJson(element as Map<String, dynamic>));
      });
    }
    return list;
  }

  @override
  Future<List<ItEmployeeModel>> getItDepartmentEmployees() async {
    final list = <ItEmployeeModel>[];
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(SharedPreferencesKeys.itCachedDataKey);
    if (data != null) {
      final result = json.decode(data);
      result.forEach((element) {
        list.add(ItEmployeeModel.fromJson(element as Map<String, dynamic>));
      });
    }
    return list;
  }
}

class SharedPreferencesKeys {
  static String hrCachedDataKey = 'hrCachedDataKey';
  static String itCachedDataKey = 'itCachedDataKey';
}
