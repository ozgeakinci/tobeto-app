import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvent { Anasayfa, Katalog, Takvim, Profil, Degerlendirmeler }

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    on<NavigationEvent>((event, emit) {
      switch (event) {
        case NavigationEvent.Anasayfa:
          emit(0);
          break;
        case NavigationEvent.Katalog:
          emit(1);
          break;
        case NavigationEvent.Takvim:
          emit(2);
          break;
        case NavigationEvent.Profil:
          emit(3);
          break;
        case NavigationEvent.Degerlendirmeler:
          emit(4);
          break;
      }
    });
  }
}
