// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/user_model.dart';

abstract class UserEvent {}

class FetchUserRequested extends UserEvent {}

class SendUserInfo extends UserEvent {
  UserModel user;
  SendUserInfo({
    required this.user,
  });
}

class ResetUserEvent extends UserEvent {}
