import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    String usernameInitials = '';

    String getGreetingMessage() {
      DateTime now = DateTime.now();
      int currentHour = now.hour;

      String greeting;
      if (currentHour >= 6 && currentHour < 12) {
        greeting = "Günaydın";
      } else if (currentHour >= 18 && currentHour < 24) {
        greeting = "İyi akşamlar";
      } else {
        greeting = "Merhaba";
      }

      return greeting;
    }

    String getUserInitials(String username) {
      final nameParts = username.split(' ');
      final initials = nameParts.map((part) => part[0]).join('');

      if (nameParts.length > 1) {
        final lastNameInitial = nameParts.last[0];
        return '${initials[0]}$lastNameInitial';
      }

      return initials;
    }

    on<FetchUserRequested>((event, emit) async {
      emit(UserLoading());

      try {
        final userInfos = await UserRepositories().getUserInfoFromFirebase();
        String greeting = getGreetingMessage();
        usernameInitials = getUserInitials(userInfos.username);
        print("Veriler Çekildii");
        print(userInfos.username);
        print(userInfos.department);
        emit(UserLoaded(
          username: userInfos.username,
          department: userInfos.department,
          email: userInfos.email,
          applicationStatus: userInfos.applicationStatus,
          greeting: greeting,
          usernameInitials: usernameInitials,
        ));
      } catch (e) {
        emit(UserLoaded(
          username: "No name",
          department: "No Department",
          email: '',
          applicationStatus: false,
          greeting: '',
          usernameInitials: '',
        )); // Degişecek
        print("HatayaDüştü");
        print(e);
      }
    });

    on<ResetUserEvent>((event, emit) async {
      emit(UserInitial());
    });
  }
}
