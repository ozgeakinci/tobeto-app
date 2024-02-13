import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String username;
  String department;
  String email;
  bool applicationStatus;

  UserModel({
    required this.username,
    required this.department,
    required this.email,
    required this.applicationStatus,
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
      department: map['department'] as String,
      email: map['email'] as String,
      applicationStatus: map['applicationStatus'] as bool,
    );
  }

/*   String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromFireStore(json.decode(source) as DocumentSnapshot<Map<String, dynamic>>); */
}
