import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_event.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarUpdate> {
  BottomNavbarBloc() : super(BottomNavbarUpdate(0)) {
    on<UpdatePageIndexEvent>(_onUpdatePageIndex);
  }

  void _onUpdatePageIndex(
      UpdatePageIndexEvent event, Emitter<BottomNavbarUpdate> emit) {
    emit(BottomNavbarUpdate(event.index));
  }

  @override
  Stream<BottomNavbarUpdate> mapEventToState(BottomNavbarEvent event) async* {
    if (event is UpdatePageIndexEvent) {
      yield BottomNavbarUpdate(event.index);
    }
  }
}
