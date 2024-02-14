import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum Department {
  isanalisti,
  mobil,
  fullstack,
  work,
}

extension DepartmentExtension on Department {
  String get stringValue {
    switch (this) {
      case Department.isanalisti:
        return 'İş Analisti';
      case Department.mobil:
        return 'Mobil';
      case Department.fullstack:
        return 'Full Stack';
      case Department.work:
        return 'Work';
      default:
        return '';
    }
  }
}

class UserModel {
  String username;
  String department;
  String email;
  bool applicationStatus;
  String about;
  DateTime birthDate;

  UserModel({
    required this.username,
    required this.department,
    required this.email,
    required this.applicationStatus,
    required this.about,
    required this.birthDate,
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
      about: map['about'] as String,
      birthDate: map['birthDate'] == null
          ? DateTime.now()
          : (map['birthDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'department': department,
      'email': email,
      'applicationStatus': applicationStatus,
      'about': about,
      'birthDate': birthDate
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'] as String,
        department: json['department'] as String,
        email: json['email'] as String,
        applicationStatus: json['applicationStatus'] as bool,
        about: json['about'] as String,
        birthDate: json['birthDate'] as DateTime);
  }

/*   String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromFireStore(json.decode(source) as DocumentSnapshot<Map<String, dynamic>>); */
}
