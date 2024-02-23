import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/calendar/calendar_event.dart';
import 'package:tobeto_app/bloc/calendar/calendar_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<FetchCalendarRequested>((event, emit) async {
      emit(CalendarLoading());

      try {
        final calendarInfos = await UserRepositories()
            .getCalendarInfoFromFirebase(event.department);

        emit(CalendarLoaded(
          derslerInfo: calendarInfos.lessons,
        ));
      } catch (e) {
        emit(CalendarError());
      }
    });

    on<ResetCalendarEvent>((event, emit) async {
      emit(CalendarInitial());
    });
  }
}
