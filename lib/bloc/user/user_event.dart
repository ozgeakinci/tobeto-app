// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/expreince_model.dart';
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

class ResetUserEvent extends UserEvent {}
