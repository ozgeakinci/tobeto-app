import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_event.dart';
import 'package:tobeto_app/bloc/notifications/notifications_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<FetchNotificationsRequested>((event, emit) async {
      emit(NotificationLoading());
      try {
        final natificationInfo = await UserRepositories()
            .getNotificationInfoFromFirebase(event.department);

        emit(NotificationLoaded(notifications: natificationInfo.notifications));
      } catch (e) {
        emit(NotificationError());
        print("NotificationError FetchNotificationsRequested erorrrr");
        print(e);
      }
    });

    on<ResetNotificationsEvent>((event, emit) async {
      try {
        emit(NotificationInitial());
        print("NotificationInitial Durumuna geçildiiiii");
      } catch (e) {
        emit(NotificationError());
        print("NotificationError ResetNotificationsEvent erorrrr");
        print(e);
      }
    });
  }
}
