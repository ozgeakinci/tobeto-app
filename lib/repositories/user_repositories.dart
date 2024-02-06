import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/user_model.dart';
import 'package:tobeto_app/model/department_model.dart';
import 'package:tobeto_app/model/notification_model.dart';

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

  // KATALOG SAYFASI BİLGİLERİ
  Future<DepartmentModel> getCatalogInfoFromFirebase() async {
    final catalogFromDb = await firebaseFirestore
        .collection('catalog')
        .doc("catalogvideos")
        .get();

    final catalogInfo = DepartmentModel.fromDepartmentFireStore(catalogFromDb);
    return catalogInfo;
  }

  // EĞİTİMLERİM SAYFASI BİLGİLERİ
  Future<DepartmentModel> getDepartmentInfoFromFirebase(
      String department) async {
    final educationsFromDb =
        await firebaseFirestore.collection('educations').doc(department).get();

    final departmentEducationsInfo =
        DepartmentModel.fromDepartmentFireStore(educationsFromDb);
    return departmentEducationsInfo;
  }

  // DUYURU VE HABERLERİM SAYFASI BİLGİLERİ
  Future<NotificationModel> getNotificationInfoFromFirebase(
      String department) async {
    final notificationsFromDb =
        await firebaseFirestore.collection('educations').doc(department).get();

    final notifications =
        NotificationModel.fromNotificationsFireStore(notificationsFromDb);
    return notifications;
  }
}