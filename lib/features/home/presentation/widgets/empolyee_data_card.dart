import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';
import 'package:flutter/material.dart';

class EmployeeDataCard extends StatelessWidget {
  const EmployeeDataCard({required this.employeeEntity, super.key});
  final BaseEmployeeEntity employeeEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person_2),
                subtitle: Text(
                  'id: ${employeeEntity.id}',
                  style: const TextStyle(color: Colors.white),
                ),
                title: Text(
                  'Name: ${employeeEntity.firstName} ${employeeEntity.lastName}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
