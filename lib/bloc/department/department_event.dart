abstract class DepartmentEvent {}

class ResetDepartmentEvent extends DepartmentEvent {}

class GetDepartment extends DepartmentEvent {
  String department;
  GetDepartment({
    required this.department,
  });
}
