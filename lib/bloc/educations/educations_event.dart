abstract class EducationsEvent {}

class FetchDepartmentRequested extends EducationsEvent {
  String department;
  FetchDepartmentRequested({
    required this.department,
  });
}

class ResetDepartmentEvent extends EducationsEvent {}
