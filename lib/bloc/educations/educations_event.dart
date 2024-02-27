abstract class EducationsEvent {}

class FetchEducationsRequested extends EducationsEvent {
  String department;
  FetchEducationsRequested({
    required this.department,
  });
}

class ResetEducationsEvent extends EducationsEvent {}
