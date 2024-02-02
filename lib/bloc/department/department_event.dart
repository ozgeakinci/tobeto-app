abstract class DepartmentEvent {}

class GetDepartmentX extends DepartmentEvent {
  String department;
  GetDepartmentX({
    required this.department,
  });
}
