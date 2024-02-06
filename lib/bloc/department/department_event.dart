abstract class DepartmentEvent {}

class FetchDepartmentRequested extends DepartmentEvent {
  String department;
  FetchDepartmentRequested({
    required this.department,
  });
}

class ResetDepartmentEvent extends DepartmentEvent {}
