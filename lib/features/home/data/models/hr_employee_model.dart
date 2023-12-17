import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';

class HrEmployeeModel extends BaseEmployeeEntity {
  HrEmployeeModel({
    required super.id,
    required super.firstName,
    required super.lastName,
  });
  factory HrEmployeeModel.fromJson(Map<String, dynamic> json) {
    return HrEmployeeModel(
      id: json['id'] as int,
      firstName: json['name'] as String,
      lastName: json['email'] as String,
    );
  }
}
