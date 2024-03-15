// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/watched_video_model.dart';

abstract class UserEvent {}

class FetchUserRequested extends UserEvent {}

class SendUserInfo extends UserEvent {
  UserModel user;
  SendUserInfo({
    required this.user,
  });
}

//--------Skills AREA----------------

class AddSkills extends UserEvent {
  final List<String> addedSkills;

  AddSkills({
    required this.addedSkills,
  });
}

class DeleteSkills extends UserEvent {
  final String deletedSkills;

  DeleteSkills({
    required this.deletedSkills,
  });
}
//--------Experience AREA----------------

class AddExperience extends UserEvent {
  ExperienceInfo experienceDetail;

  AddExperience({
    required this.experienceDetail,
  });
}

class DeleteExperience extends UserEvent {
  int index;

  DeleteExperience({
    required this.index,
  });
}

//--------Language AREA----------------

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

//--------Education AREA----------------

class AddEducation extends UserEvent {
  EducationInfo userEducations;
  AddEducation({
    required this.userEducations,
  });
}

class DeleteEducation extends UserEvent {
  int index;

  DeleteEducation({
    required this.index,
  });
}

//--------WatchedVideo AREA----------------

class UpdateWatchedVideos extends UserEvent {
  final List<WatchedVideo> watchedVideos;

  UpdateWatchedVideos({
    required this.watchedVideos,
  });
}

class ResetUserEvent extends UserEvent {}
