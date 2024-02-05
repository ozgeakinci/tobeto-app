import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/auth_model.dart';
import 'package:tobeto_app/model/department_model.dart';
import 'package:tobeto_app/model/notification_model.dart';

class UserRepositories {
  Future<UserModel> getUserInfoFromFirebase() async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb = await firestoreUser
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final userInfo = UserModel.fromUserFireStore(userFromDb);
    return userInfo;
  }

  Future<DepartmentModel> getDepartmentInfoFromFirebase(
      String department) async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb =
        await firestoreUser.collection('educations').doc(department).get();

    final departmentInfo = DepartmentModel.fromDepartmentFireStore(userFromDb);
    print("Eğitimlerim $departmentInfo");
    return departmentInfo;
  }

  Future<DepartmentModel> getCatalogInfoFromFirebase() async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb =
        await firestoreUser.collection('catalog').doc("catalogvideos").get();

    final departmentInfo = DepartmentModel.fromDepartmentFireStore(userFromDb);
    return departmentInfo;
  }

  Future<NotificationModel> getNotificationInfoFromFirebase(
      String department) async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb =
        await firestoreUser.collection('educations').doc(department).get();
    print("Notification $userFromDb");

    final notifications =
        NotificationModel.fromNotificationsFireStore(userFromDb);
    return notifications;
  }
}
