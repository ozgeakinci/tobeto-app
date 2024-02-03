import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_event.dart';
import 'package:tobeto_app/bloc/catalog/catalog_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(InitialCatalogState()) {
    on<GetCatalogEvent>((event, emit) async {
      try {
        final catalogInfos =
            await UserRepositories().getCatalogInfoFromFirebase();
        print("Veriler Çekildii");
        print(catalogInfos.videos);
        emit(GetCatalogInfo(educationCatalogInfo: catalogInfos.videos));
      } catch (e) {
        emit(GetCatalogInfo(educationCatalogInfo: [])); // Degişecek
        print("HatayaDüştü");
        print(e);
      }
    });

    on<ResetCatalogEvent>((event, emit) async {
      try {
        emit(InitialCatalogState());
        print("InitialCatalogState Durumuna geçildiiiii");
      } catch (e) {
        emit(GetCatalogInfo(educationCatalogInfo: [])); // Degişecek
        print("HatayaDüştü Resetttt");
        print(e);
      }
    });
  }
}
