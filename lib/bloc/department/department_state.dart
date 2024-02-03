import 'package:tobeto_app/model/department_model.dart';

abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoading extends DepartmentState {}

class DepartmentLoaded extends DepartmentState {
  final List<DepartmentVideoModel> educationDepartmenogInfo;
  DepartmentLoaded({
    required this.educationDepartmenogInfo,
  });
}

class DepartmentError extends DepartmentState {}
