import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_event.dart';
import 'package:tobeto_app/bloc/notifications/notifications_state.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

import 'package:tobeto_app/view/widgets/notification_card.dart';

class AnnounccementAndnews extends StatelessWidget {
  const AnnounccementAndnews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Duyuru ve Haberlerim',
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
        if (state is NotificationInitial) {
          context.read<NotificationBloc>().add(FetchNotificationsRequested(
              department: userBloc.userDepartment!));
        }

        if (state is NotificationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NotificationLoaded) {
          return Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) => NotificationCard(
                      department: state.notifications[index])));
        } else {
          return const Center(child: Text("Yükleniyor....."));
        }
      }),
    );
  }
}
