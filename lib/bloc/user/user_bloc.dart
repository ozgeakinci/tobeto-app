import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserRequested>((event, emit) async {
      emit(UserLoading());
      try {
        final userInfos = await UserRepositories().getUserInfoFromFirebase();
        print("Veriler Çekildii");
        print(userInfos.username);
        print(userInfos.department);
        emit(UserLoaded(
            username: userInfos.username, department: userInfos.department));
      } catch (e) {
        emit(UserLoaded(
            username: "No name", department: "No Department")); // Degişecek
        print("HatayaDüştü");
        print(e);
      }
    });
  }
}
