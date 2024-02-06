abstract class NotificationEvent {}

class FetchNotificationsRequested extends NotificationEvent {
  String department;
  FetchNotificationsRequested({
    required this.department,
  });
}

class ResetNotificationsEvent extends NotificationEvent {}
