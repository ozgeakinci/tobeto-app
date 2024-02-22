import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/calendar_model.dart';
import 'package:tobeto_app/models/catalog_model.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/department_model.dart';
import 'package:tobeto_app/models/notification_model.dart';

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
      print("getUserInfoFromFirebase error: $e");
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
//-----------------------Language AREA -----------------------

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
}
