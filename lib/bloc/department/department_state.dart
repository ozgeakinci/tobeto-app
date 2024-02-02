abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoading extends DepartmentState {}

class DepartmentLoaded extends DepartmentState {
  final String educationDepartmentInfo;
  DepartmentLoaded({
    required this.educationDepartmentInfo,
  });
}

class DepartmentError extends DepartmentState {}
