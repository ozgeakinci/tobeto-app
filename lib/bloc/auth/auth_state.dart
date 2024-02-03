// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/model/department_model.dart';

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
/* 
class GetDepartmentInfo extends AuthState {
  final List<DepartmentVideoModel> educationDepartmentInfo;
  GetDepartmentInfo({
    required this.educationDepartmentInfo,
  });
} */
