import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/calendar_model.dart';
import 'package:tobeto_app/models/catalog_model.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/department_model.dart';
import 'package:tobeto_app/models/notification_model.dart';
import 'package:tobeto_app/models/watched_video_model.dart';

class UserRepositories {
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  // KULLANICI BİLGİLERİ       // fetchUserInfoFromFirebase ?
  Future<UserModel> getUserInfoFromFirebase() async {
    try {
      final userFromDb = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get();

      final userInfo = UserModel.fromUserFireStore(userFromDb);
      return userInfo;
    } catch (e) {
      throw e;
    }
  }

  // TAKVİM SAYFASI BİLGİLERİ
  Future<CalendarModel> getCalendarInfoFromFirebase(String department) async {
    final calendarFromDb =
        await firebaseFirestore.collection('department').doc(department).get();

    final calendarInfo = CalendarModel.fromCalendarFireStore(calendarFromDb);
    return calendarInfo;
  }

  // KATALOG SAYFASI BİLGİLERİ
  Future<CatalogModel> getCatalogInfoFromFirebase() async {
    final catalogFromDb = await firebaseFirestore
        .collection('catalog')
        .doc("catalogvideos")
        .get();

    final catalogInfo = CatalogModel.fromCatalogFireStore(catalogFromDb);
    return catalogInfo;
  }

  // EĞİTİMLERİM SAYFASI BİLGİLERİ
  Future<DepartmentModel> getDepartmentInfoFromFirebase(
      String department) async {
    final educationsFromDb =
        await firebaseFirestore.collection('department').doc(department).get();

    final departmentEducationsInfo =
        DepartmentModel.fromDepartmentFireStore(educationsFromDb);
    return departmentEducationsInfo;
  }

  // DUYURU VE HABERLERİM SAYFASI BİLGİLERİ
  Future<NotificationModel> getNotificationInfoFromFirebase(
      String department) async {
    final notificationsFromDb =
        await firebaseFirestore.collection('department').doc(department).get();

    final notifications =
        NotificationModel.fromNotificationsFireStore(notificationsFromDb);
    return notifications;
  }

  // KULLANICI BİLGİLERİNİ FİREBASE'E GÖNDERME
  Future<UserModel> sendUserInfoToFirebase(UserModel user) async {
    final userRef = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid);

    await userRef.set(user.toMap());
    return user;
  }

  //---------------------- SKİLLS REPO-----------------------
  Future<UserModel> addUserSkills(List<String> skills) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        'skills': FieldValue.arrayUnion(skills),
      });
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      throw Exception("Kullanıcı yetenekleri eklenirken bir hata oluştu: $e");
    }
  }

  Future<UserModel> updateSkillsToUser({
    required String userId,
    required String deletedSkill,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Mevcut beceri listesini al
      List<dynamic>? currentSkills = userDoc.data()?['skills'];

      // Seçilen beceriyi mevcut beceri listesinden kaldır
      currentSkills?.remove(deletedSkill);

      // Güncellenmiş beceri listesini Firestore'a yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'skills': currentSkills, // Güncellenmiş beceri listesini yaz
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Beceriler güncellenirken bir hata oluştu: $e");
    }
  }

  //---------------------- EXPERİENCE REPO-----------------------
  Future<UserModel> addExperienceToUser({
    required String userId,
    required ExperienceInfo experienceInfo,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Kullanıcının mevcut deneyim listesini al
      List<dynamic>? currentExperiences = userDoc.data()?['experiences'];

      // Yeni deneyimi ekle
      if (currentExperiences != null) {
        currentExperiences.add(experienceInfo.toMap());
      } else {
        currentExperiences = [experienceInfo.toMap()];
      }

      // Firestore'a güncellenmiş bilgileri geri yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'experiences': currentExperiences,
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Deneyim eklenirken bir hata oluştu: $e");
    }
  }

  Future<UserModel> updateExperienceToUser({
    required String userId,
    required List<ExperienceInfo> updatedExperiences,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Firestore'dan mevcut deneyim listesini al
      List<dynamic>? currentExperiences = userDoc.data()?['experiences'];

      // Güncellenmiş deneyim listesini Firestore'a yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'experiences':
            updatedExperiences.map((experience) => experience.toMap()).toList(),
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Deneyim güncellenirken bir hata oluştu: $e");
    }
  }
//-----------------------Language REPO -----------------------

  Future<UserModel> addLanguageToUser({
    required String userId,
    required LanguageModel languageInfo,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Kullanıcının mevcut dil listesini al
      List<dynamic>? currentLanguages = userDoc.data()?['languages'];

      // Yeni dili ekle
      if (currentLanguages != null) {
        currentLanguages.add(languageInfo.toMap());
      } else {
        currentLanguages = [languageInfo.toMap()];
      }

      // Firestore'a güncellenmiş bilgileri geri yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'languages': currentLanguages,
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Dil eklenirken bir hata oluştu: $e");
    }
  }

  Future<UserModel> updateLanguagesToUser({
    required String userId,
    required List<LanguageModel> updatedLanguages,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Firestore'dan mevcut deneyim listesini al
      List<dynamic>? currentLanguages = userDoc.data()?['languages'];

      // Güncellenmiş deneyim listesini Firestore'a yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'languages':
            updatedLanguages.map((language) => language.toMap()).toList(),
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Deneyim güncellenirken bir hata oluştu: $e");
    }
  }

  //-----------------------Educations REPO -----------------------

  Future<UserModel> addEducationToUser({
    required String userId,
    required EducationInfo userEducation,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Kullanıcının mevcut eğitim listesini al
      List<dynamic>? currentEducations = userDoc.data()?['userEducations'];

      // Yeni eğitimi ekle
      if (currentEducations != null) {
        currentEducations.add(userEducation.toMap());
      } else {
        currentEducations = [userEducation.toMap()];
      }

      // Firestore'a güncellenmiş bilgileri geri yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'userEducations': currentEducations,
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Eğitim eklenirken bir hata oluştu: $e");
    }
  }

  Future<UserModel> updateEducationToUser({
    required String userId,
    required List<EducationInfo> updatedEducations,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Firestore'dan mevcut deneyim listesini al
      List<dynamic>? currentEducations = userDoc.data()?['userEducations'];

      // Güncellenmiş deneyim listesini Firestore'a yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'userEducations':
            updatedEducations.map((education) => education.toMap()).toList(),
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("Deneyim güncellenirken bir hata oluştu: $e");
    }
  }

  //-----------------------WatchedVideo REPO -----------------------

  Future<UserModel> updateWatchedVideosToUser({
    required String userId,
    required List<WatchedVideo> updatedWatchedVideos,
  }) async {
    try {
      // Firestore'dan kullanıcının mevcut bilgilerini çek
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firebaseFirestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        throw Exception("Kullanıcı bulunamadı");
      }

      // Firestore'dan mevcut watchedVideos map'ini al
      Map<String, dynamic>? currentWatchedVideos =
          userDoc.data()?['watchedVideos'];

      // Güncellenmiş watchedVideos map'ini Firestore'a yaz
      await firebaseFirestore.collection('users').doc(userId).update({
        'watchedVideos': updatedWatchedVideos,
      });

      // Güncellenmiş kullanıcı bilgilerini döndür
      return UserModel.fromUserFireStore(userDoc);
    } catch (e) {
      // Hata durumunda Exception fırlat
      throw Exception("İzlenen videolar güncellenirken bir hata oluştu: $e");
    }
  }
}
