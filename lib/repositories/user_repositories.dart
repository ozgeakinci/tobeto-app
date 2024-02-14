import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/calendar_model.dart';
import 'package:tobeto_app/model/catalog_model.dart';
import 'package:tobeto_app/model/user_model.dart';
import 'package:tobeto_app/model/department_model.dart';
import 'package:tobeto_app/model/notification_model.dart';
import 'package:tobeto_app/view/screens/menu/catalog.dart';

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
