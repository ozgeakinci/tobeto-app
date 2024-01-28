import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String username;
  String email;
  UserModel({
    required this.username,
    required this.email,
  });

/*   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
    };
  } */

  factory UserModel.fromUserFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

/*   String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromFireStore(json.decode(source) as DocumentSnapshot<Map<String, dynamic>>); */
}
