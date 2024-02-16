import 'package:tobeto_app/models/catalog_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<CatalogItem> catalogItem;
  CatalogLoaded({
    required this.catalogItem,
  });
}

class CatalogError extends CatalogState {}
