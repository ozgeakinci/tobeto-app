// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

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

class PasswordResetEmailSent extends AuthState {}

class PasswordResetError extends AuthState {
  String errorMessage;
  PasswordResetError({
    required this.errorMessage,
  });
}
