import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  String username;
  String department;
  final bool applicationStatus;
  final String greeting;
  final String usernameInitials;
  String email;
  String about;
  DateTime birthDate;
  int? phoneNumber;
  String? urlImage;
  List<String>? skills;
  List<ExperienceInfo>? experiences;
  List<LanguageModel>? languages;
  List<EducationInfo>? userEducations;

  UserLoaded(
      {required this.username,
      required this.department,
      required this.applicationStatus,
      required this.greeting,
      required this.usernameInitials,
      required this.email,
      required this.about,
      required this.birthDate,
      this.skills,
      this.experiences,
      this.userEducations,
      this.languages,
      this.phoneNumber,
      this.urlImage});
}

class UserError extends UserState {}
