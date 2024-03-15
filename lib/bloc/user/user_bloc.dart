import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/education_model.dart';
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

    void fetchAndUpdateUser() {
      add(FetchUserRequested());
    }

    //------------ User Bilgilerini Getir -------------------

    on<FetchUserRequested>((event, emit) async {
      emit(UserLoading());

      try {
        final userInfos = await UserRepositories().getUserInfoFromFirebase();
        String greeting = getGreetingMessage();
        usernameInitials = getUserInitials(userInfos.username);

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
            skills: userInfos.skills,
            userEducations: userInfos.userEducations,
            experiences: userInfos.experiences,
            languages: userInfos.languages));
      } catch (e) {
        emit(UserError());
      }
    });
    //------------ User Bilgilerini Gönder -------------------

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
            skills: userInfo.skills,
            experiences: userInfo.experiences,
            languages: userInfo.languages,
            userEducations: userInfo.userEducations));
      },
    );

    //------------------Skills BLOC-----------------------

    on<AddSkills>((event, emit) async {
      try {
        // Kullanıcının yeteneklerini Firestore'a eklemek için UserRepository'deki uygun fonksiyonu çağırın
        final skillsInfo =
            await UserRepositories().addUserSkills(event.addedSkills);
        // İşlem başarılı olduğunda bir UserSuccess durumu yayınlayın
        emit(UserLoaded(
            username: skillsInfo.username,
            department: skillsInfo.department,
            applicationStatus: skillsInfo.applicationStatus,
            greeting: "greeting",
            usernameInitials: usernameInitials,
            email: skillsInfo.email,
            about: skillsInfo.about,
            birthDate: skillsInfo.birthDate,
            phoneNumber: skillsInfo.phoneNumber,
            urlImage: skillsInfo.userImage,
            experiences: skillsInfo.experiences,
            skills: skillsInfo.skills));

        fetchAndUpdateUser();
      } catch (e) {
        emit(UserError());
      }
    });

    on<DeleteSkills>((event, emit) async {
      try {
        final skillsInfo = await UserRepositories().updateSkillsToUser(
          deletedSkill: event.deletedSkills,
          userId: _firebaseAuth.currentUser!.uid,
        );

        // Güncellenmiş beceri listesini oluşturun ve silinmek istenen becerileri kaldırın
        List<String>? updatedSkills = List.from((skillsInfo.skills ?? []));
        updatedSkills
            .removeWhere((skill) => event.deletedSkills.contains(skill));

        emit(UserLoaded(
          username: skillsInfo.username,
          department: skillsInfo.department,
          applicationStatus: skillsInfo.applicationStatus,
          greeting: "greeting",
          usernameInitials: usernameInitials,
          email: skillsInfo.email,
          about: skillsInfo.about,
          birthDate: skillsInfo.birthDate,
          phoneNumber: skillsInfo.phoneNumber,
          urlImage: skillsInfo.userImage,
          skills: skillsInfo.skills,
        ));
        fetchAndUpdateUser();
      } catch (e) {
        // Hata durumunu yönetin (örneğin, loglama veya hatayı başka bir katmana iletme)
        emit(UserError());
      }
    });

    //------------------Experince BLOC-----------------------

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
      fetchAndUpdateUser();
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
            skills: updatedUser.skills,
            experiences: updatedUser.experiences,
          ));

          fetchAndUpdateUser();
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
      fetchAndUpdateUser();
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
              experiences: updatedUser.experiences,
              languages: updatedUser.languages));
          fetchAndUpdateUser();
        }
      }
    });

    //------------------EducationLife BLOC-----------------------

    on<AddEducation>((event, emit) async {
      String greeting = getGreetingMessage();

      // Eğitimi kullanıcı bilgilerine ekleyin
      final updatedUser = await UserRepositories().addEducationToUser(
          userId: _firebaseAuth.currentUser!.uid,
          userEducation: event.userEducations);

      // UserLoaded event'i ile güncellenmiş kullanıcı bilgilerini emit et
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
          userEducations: updatedUser.userEducations));
      fetchAndUpdateUser();
    });

    on<DeleteEducation>((event, emit) async {
      String greeting = getGreetingMessage();
      if (state is UserLoaded) {
        // Kullanıcının mevcut deneyimlerini al
        List<EducationInfo>? userEducations =
            List.from((state as UserLoaded).userEducations ?? []);

        // Verilen indeksin geçerli olup olmadığını kontrol et
        if (event.index >= 0 && event.index < userEducations.length) {
          // Deneyimi listeden kaldır
          userEducations.removeAt(event.index);

          // Deneyimi Firebase'e güncelle
          final updatedUser = await UserRepositories().updateEducationToUser(
              userId: _firebaseAuth.currentUser!.uid,
              updatedEducations: userEducations);

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

              // userExperiences: updatedUser.userExperiences,
              experiences: updatedUser.experiences,
              languages: updatedUser.languages,
              userEducations: updatedUser.userEducations));
          fetchAndUpdateUser();
        }
      }
    });

    on<UpdateWatchedVideos>((event, emit) async {
      String greeting = getGreetingMessage();
      try {
        // Kullanıcının mevcut ID'sini al
        String userId = FirebaseAuth.instance.currentUser!.uid;

        // Güncellenmiş izlenen videoları Firestore'a gönder
        final updatedUser = await UserRepositories().updateWatchedVideosToUser(
          userId: userId,
          updatedWatchedVideos: event.watchedVideos,
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
          watchedVideos: updatedUser.watchedVideos,
        ));
      } catch (e) {
        // Hata durumunu yönetin
        emit(UserError());
      }
    });

    on<ResetUserEvent>((event, emit) async {
      emit(UserInitial());
    });
  }
}
