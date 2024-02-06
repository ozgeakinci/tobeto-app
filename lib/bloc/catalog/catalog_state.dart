import 'package:tobeto_app/model/department_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatologLoaded extends CatalogState {
  final List<DepartmentLessonModel> educationCatalogInfo;
  CatologLoaded({
    required this.educationCatalogInfo,
  });
}

class CatalogError extends CatalogState {}
