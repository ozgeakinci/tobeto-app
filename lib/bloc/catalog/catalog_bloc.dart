import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_event.dart';
import 'package:tobeto_app/bloc/catalog/catalog_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final repositories = UserRepositories();
  CatalogBloc() : super(CatalogInitial()) {
    on<FetchCatalogRequested>((event, emit) async {
      emit(CatalogLoading());
      try {
        final catalogInfos = await repositories.getCatalogInfoFromFirebase();
        emit(CatalogLoaded(catalogItem: catalogInfos.lessonList));
      } catch (e) {
        emit(CatalogError());
      }
    });

    on<ResetCatalogEvent>((event, emit) async {
      try {
        emit(CatalogInitial());
      } catch (e) {
        emit(CatalogError());
      }
    });
  }
}
