import 'package:tobeto_app/models/department_model.dart';

abstract class EducationsState {}

class EducationsInitial extends EducationsState {}

class EducationsLoading extends EducationsState {}

class EducationsLoaded extends EducationsState {
  final List<DepartmentLessonModel> educationDepartmenogInfo;
  EducationsLoaded({
    required this.educationDepartmenogInfo,
  });
}

class EducationsError extends EducationsState {}
