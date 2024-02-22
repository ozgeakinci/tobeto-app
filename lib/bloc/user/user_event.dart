// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/user_model.dart';

abstract class UserEvent {}

class FetchUserRequested extends UserEvent {}

class SendUserInfo extends UserEvent {
  UserModel user;
  SendUserInfo({
    required this.user,
  });
}

class AddExperience extends UserEvent {
  ExperienceInfo experienceDetail;

  AddExperience({
    required this.experienceDetail,
  });
}

class AddSkills extends UserEvent {
  final List<String> addedSkills;

  AddSkills({
    required this.addedSkills,
  });
}

class DeleteExperience extends UserEvent {
  int index;

  DeleteExperience({
    required this.index,
  });
}

class AddLanguage extends UserEvent {
  LanguageModel language;
  AddLanguage({
    required this.language,
  });
}

class DeleteLanguage extends UserEvent {
  int index;

  DeleteLanguage({
    required this.index,
  });
}

class ResetUserEvent extends UserEvent {}
