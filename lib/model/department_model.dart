import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DepartmentModel {
  String videoUrl;
  DepartmentModel({required this.videoUrl});

/*   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
    };
  } */

  factory DepartmentModel.fromDepartmentFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return DepartmentModel(
      videoUrl: map['videomobil'] as String,
    );
  }

/*   String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromFireStore(json.decode(source) as DocumentSnapshot<Map<String, dynamic>>); */
}
