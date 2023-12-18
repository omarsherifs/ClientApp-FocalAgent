abstract class BaseEmployeeEntity {
  const BaseEmployeeEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  final int id;
  final String firstName;
  final String lastName;
}
