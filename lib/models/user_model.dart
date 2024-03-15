import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/watched_video_model.dart';

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
  int phoneNumber;
  String? userImage;
  List<String>? skills;
  List<ExperienceInfo>? experiences;
  List<LanguageModel>? languages;
  List<EducationInfo>? userEducations;
  List<WatchedVideo>? watchedVideos;

  UserModel(
      {required this.username,
      required this.department,
      required this.email,
      required this.applicationStatus,
      required this.about,
      required this.birthDate,
      required this.phoneNumber,
      required this.userImage,
      this.skills,
      this.experiences,
      this.languages,
      this.userEducations,
      this.watchedVideos});

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
      phoneNumber: map['phoneNumber'] == null ? 0 : (map['phoneNumber'] as int),
      userImage: map['imageUrl'] as String?,
      skills: map['skills'] != null
          ? List<String>.from(map['skills'])
          : null, // Yetenekler listesi
      experiences: map['experiences'] != null
          ? List<ExperienceInfo>.from(
              (map['experiences'] as List<dynamic>).map(
                (experience) =>
                    ExperienceInfo.fromJson(experience as Map<String, dynamic>),
              ),
            )
          : [],
      languages: map['languages'] != null
          ? List<LanguageModel>.from(
              (map['languages'] as List<dynamic>).map(
                (language) =>
                    LanguageModel.fromJson(language as Map<String, dynamic>),
              ),
            )
          : [],
      userEducations: map['userEducations'] != null
          ? List<EducationInfo>.from(
              (map['userEducations'] as List<dynamic>).map(
                (education) =>
                    EducationInfo.fromJson(education as Map<String, dynamic>),
              ),
            )
          : [],
      watchedVideos: map['watchedVideos'] != null
          ? List<WatchedVideo>.from((map['watchedVideos'] as List<dynamic>).map(
              (watchedVideo) =>
                  WatchedVideo.fromJson(watchedVideo as Map<String, dynamic>)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'department': department,
      'email': email,
      'applicationStatus': applicationStatus,
      'about': about,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'imageUrl': userImage,
      'skills': skills, // Yetenekler listesi
      'experiences': experiences != null
          ? experiences!.map((experience) => experience.toMap()).toList()
          : [],
      'languages': languages != null
          ? languages!.map((language) => language.toMap()).toList()
          : [],
      'userEducations': userEducations != null
          ? userEducations!
              .map((userEducation) => userEducation.toMap())
              .toList()
          : [],
      'watchedVideos': watchedVideos != null
          ? watchedVideos!.map((watchedVideo) => watchedVideo.toMap()).toList()
          : null,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      department: json['department'] as String,
      email: json['email'] as String,
      applicationStatus: json['applicationStatus'] as bool,
      about: json['about'] as String,
      birthDate: json['birthDate'] as DateTime,
      phoneNumber: json['phoneNumber'] as int,
      userImage: json['imageUrl'] as String,
      skills: json['skills'] != null ? List<String>.from(json['skills']) : [],
      experiences: (json['experiences'] as List<dynamic>?)
          ?.map((exp) => ExperienceInfo.fromJson(exp as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((exp) => LanguageModel.fromJson(exp as Map<String, dynamic>))
          .toList(),
      userEducations: (json['userEducations'] as List<dynamic>?)
          ?.map((exp) => EducationInfo.fromJson(exp as Map<String, dynamic>))
          .toList(),
    );
  }

  UserModel copyWith({
    String? username,
    String? department,
    String? about,
    DateTime? birthDate,
    String? email,
    bool? applicationStatus,
    int? phoneNumber,
    String? userImage,
    List<String>? experiences,
  }) {
    return UserModel(
      username: username ?? this.username,
      department: department ?? this.department,
      about: about ?? this.about,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      applicationStatus: applicationStatus ?? this.applicationStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userImage: userImage ?? this.userImage,
    );
  }
}
