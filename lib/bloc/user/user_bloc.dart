import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  String? userDepartment;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
        userDepartment = userInfos.department;

        emit(UserLoaded(
            username: userInfos.username,
            department: userInfos.department,
            email: userInfos.email,
            applicationStatus: userInfos.applicationStatus,
            greeting: greeting,
            usernameInitials: usernameInitials,
            about: userInfos.about,
            birthDate: userInfos.birthDate,
            phoneNumber: userInfos.phoneNumber,
            urlImage: userInfos.userImage,
            userExperiences: userInfos.userExperiences,
            experiences: userInfos.experiences,
            languages: userInfos.languages));
      } catch (e) {
        emit(UserLoaded(
          username: "No name",
          department: "No Department",
          email: '',
          applicationStatus: false,
          greeting: '',
          usernameInitials: '',
          about: '',
          birthDate: DateTime.now(),
          phoneNumber: 5432144321,
        ));
        print("HatayaDüştü");
        print(e);
      }
    });

    on<SendUserInfo>(
      (event, emit) async {
        String greeting = getGreetingMessage();
        final userInfo =
            await UserRepositories().sendUserInfoToFirebase(event.user);
        emit(UserLoaded(
            username: userInfo.username,
            department: userInfo.department,
            applicationStatus: userInfo.applicationStatus,
            greeting: greeting,
            usernameInitials: usernameInitials,
            email: userInfo.email,
            about: userInfo.about,
            birthDate: userInfo.birthDate,
            phoneNumber: userInfo.phoneNumber,
            urlImage: userInfo.userImage,
            userExperiences: userInfo.userExperiences,
            experiences: userInfo.experiences,
            languages: userInfo.languages));
      },
    );

    //------------------Experience BLOC-----------------------

    on<AddExperience>((event, emit) async {
      String greeting = getGreetingMessage();

      // Deneyimi kullanıcı bilgilerine ekleyin
      final updatedUser = await UserRepositories().addExperienceToUser(
        userId: _firebaseAuth.currentUser!.uid,
        experienceInfo: event.experienceDetail,
      );

      // UserLoaded event'i ile güncellenmiş kullanıcı bilgilerini emit edin
      emit(UserLoaded(
        username: updatedUser.username,
        department: updatedUser.department,
        applicationStatus: updatedUser.applicationStatus,
        greeting: greeting,
        usernameInitials: usernameInitials,
        email: updatedUser.email,
        about: updatedUser.about,
        birthDate: updatedUser.birthDate,
        phoneNumber: updatedUser.phoneNumber,
        urlImage: updatedUser.userImage,
        experiences: updatedUser.experiences,
      ));
    });

    on<DeleteExperience>((event, emit) async {
      String greeting = getGreetingMessage();
      if (state is UserLoaded) {
        // Kullanıcının mevcut deneyimlerini al
        List<ExperienceInfo>? experiences =
            List.from((state as UserLoaded).experiences ?? []);

        // Verilen indeksin geçerli olup olmadığını kontrol et
        if (event.index >= 0 && event.index < experiences.length) {
          // Deneyimi listeden kaldır
          experiences.removeAt(event.index);

          // Deneyimi Firebase'e güncelle
          final updatedUser = await UserRepositories().updateExperienceToUser(
            userId: _firebaseAuth.currentUser!.uid,
            updatedExperiences: experiences,
          );

          // Güncellenmiş kullanıcı bilgilerini emit et
          emit(UserLoaded(
            username: updatedUser.username,
            department: updatedUser.department,
            applicationStatus: updatedUser.applicationStatus,
            greeting: greeting,
            usernameInitials: usernameInitials,
            email: updatedUser.email,
            about: updatedUser.about,
            birthDate: updatedUser.birthDate,
            phoneNumber: updatedUser.phoneNumber,
            urlImage: updatedUser.userImage,
            userExperiences: updatedUser.userExperiences,
            experiences: updatedUser.experiences,
          ));
        }
      }
    });

    //------------------Language BLOC-----------------------

    on<AddLanguage>((event, emit) async {
      String greeting = getGreetingMessage();

      // Dil bilgisini kullanıcı bilgilerine ekleyin
      final updatedUser = await UserRepositories().addLanguageToUser(
        userId: _firebaseAuth.currentUser!.uid,
        languageInfo: event.language,
      );

      // UserLoaded event'i ile güncellenmiş kullanıcı bilgilerini emit edin
      emit(UserLoaded(
        username: updatedUser.username,
        department: updatedUser.department,
        applicationStatus: updatedUser.applicationStatus,
        greeting: greeting,
        usernameInitials: usernameInitials,
        email: updatedUser.email,
        about: updatedUser.about,
        birthDate: updatedUser.birthDate,
        phoneNumber: updatedUser.phoneNumber,
        urlImage: updatedUser.userImage,
        languages: updatedUser.languages,
      ));
    });

    on<DeleteLanguage>((event, emit) async {
      String greeting = getGreetingMessage();
      if (state is UserLoaded) {
        // Kullanıcının mevcut deneyimlerini al
        List<LanguageModel>? languages =
            List.from((state as UserLoaded).languages ?? []);

        // Verilen indeksin geçerli olup olmadığını kontrol et
        if (event.index >= 0 && event.index < languages.length) {
          // Deneyimi listeden kaldır
          languages.removeAt(event.index);

          // Deneyimi Firebase'e güncelle
          final updatedUser = await UserRepositories().updateLanguagesToUser(
            userId: _firebaseAuth.currentUser!.uid,
            updatedLanguages: languages,
          );

          // Güncellenmiş kullanıcı bilgilerini emit et
          emit(UserLoaded(
              username: updatedUser.username,
              department: updatedUser.department,
              applicationStatus: updatedUser.applicationStatus,
              greeting: greeting,
              usernameInitials: usernameInitials,
              email: updatedUser.email,
              about: updatedUser.about,
              birthDate: updatedUser.birthDate,
              phoneNumber: updatedUser.phoneNumber,
              urlImage: updatedUser.userImage,
              userExperiences: updatedUser.userExperiences,
              experiences: updatedUser.experiences,
              languages: updatedUser.languages));
        }
      }
    });

    on<ResetUserEvent>((event, emit) async {
      emit(UserInitial());
    });
  }
}
