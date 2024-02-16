import 'package:tobeto_app/models/calendar_model.dart';

abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  // final DateTime calendar;
  final List<CalendarLessonModel> derslerInfo;

  CalendarLoaded({
    // required this.calendar,
    required this.derslerInfo,
  });
}

class CalendarError extends CalendarState {}
