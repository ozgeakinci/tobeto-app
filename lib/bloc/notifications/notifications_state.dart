import 'package:tobeto_app/models/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationsModel> notifications;
  NotificationLoaded({
    required this.notifications,
  });
}

class NotificationError extends NotificationState {}
