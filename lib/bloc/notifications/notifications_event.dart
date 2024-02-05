abstract class NotificationEvent {}

class ResetEvent extends NotificationEvent {}

class GetNotification extends NotificationEvent {
  String department;
  GetNotification({
    required this.department,
  });
}
