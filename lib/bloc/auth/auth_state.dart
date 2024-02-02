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

class GetUserInfo extends AuthState {
  final String username;
  final String department;
  GetUserInfo({
    required this.username,
    required this.department,
  });
}

class GetDepartmentInfo extends AuthState {
  final String educationDepartmentInfo;
  GetDepartmentInfo({
    required this.educationDepartmentInfo,
  });
}
