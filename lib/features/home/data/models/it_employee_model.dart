import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';

class ItEmployeeModel extends BaseEmployeeEntity {
  ItEmployeeModel({
    required super.id,
    required super.firstName,
    required super.lastName,
  });
  factory ItEmployeeModel.fromJson(Map<String, dynamic> json) {
    return ItEmployeeModel(
      id: json['id'] as int,
      firstName: json['name'] as String,
      lastName: json['email'] as String,
    );
  }
}
