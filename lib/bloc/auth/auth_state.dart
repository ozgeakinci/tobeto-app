// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;
  NotAuthenticated({
    this.errorMessage,
  });
}

class Authenticated extends AuthState {
  User? user;
  Authenticated({
    this.user,
  });
}
