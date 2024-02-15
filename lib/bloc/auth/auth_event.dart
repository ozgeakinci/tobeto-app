// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class AuthEvent {}

class Login extends AuthEvent {
  String email;
  String password;
  // BuildContext? context;
  Login({
    required this.email,
    required this.password,
    // this.context
  });
}

class Register extends AuthEvent {
  String email;
  String password;
  String username;
  String department;
  bool applicationstatus;
  String? about;
  DateTime? birthDate;
  int? phoneNumber;
  // BuildContext? context;

  Register({
    required this.email,
    required this.password,
    required this.username,
    required this.department,
    required this.applicationstatus,
    this.about,
    this.birthDate,
    this.phoneNumber,
    // this.context
  });
}

class ResetPassword extends AuthEvent {
  String email;
  ResetPassword({
    required this.email,
  });
}

class Logout extends AuthEvent {}
