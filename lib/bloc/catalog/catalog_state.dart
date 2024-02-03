import 'package:tobeto_app/model/department_model.dart';

abstract class CatalogState {}

class InitialCatalogState extends CatalogState {}

class GetCatalogInfo extends CatalogState {
  final List<DepartmentVideoModel> educationCatalogInfo;
  GetCatalogInfo({
    required this.educationCatalogInfo,
  });
}
