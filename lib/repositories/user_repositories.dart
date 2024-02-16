import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/calendar_model.dart';
import 'package:tobeto_app/models/catalog_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/department_model.dart';
import 'package:tobeto_app/models/notification_model.dart';

class UserRepositories {
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  // KULLANICI BİLGİLERİ       // fetchUserInfoFromFirebase ?
  Future<UserModel> getUserInfoFromFirebase() async {
    final userFromDb = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    final userInfo = UserModel.fromUserFireStore(userFromDb);
    return userInfo;
  }

  // TAKVİM SAYFASI BİLGİLERİ
  Future<CalendarModel> getCalendarInfoFromFirebase(String department) async {
    final calendarFromDb =
        await firebaseFirestore.collection('takvim').doc(department).get();

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
}
