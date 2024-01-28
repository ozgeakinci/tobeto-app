import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/auth_model.dart';

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
}
