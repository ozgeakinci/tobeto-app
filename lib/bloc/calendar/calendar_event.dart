abstract class CalendarEvent {}

class FetchCalendarRequested extends CalendarEvent {
  String department;
  FetchCalendarRequested({
    required this.department,
  });
}

class ResetCalendarEvent extends CalendarEvent {}
