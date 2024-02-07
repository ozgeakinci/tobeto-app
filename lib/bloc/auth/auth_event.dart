// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthEvent {}

class Login extends AuthEvent {
  String email;
  String password;
  Login({
    required this.email,
    required this.password,
  });
}

class Register extends AuthEvent {
  String email;
  String password;
  String username;
  String department;
  bool applicationstatus;
  Register({
    required this.email,
    required this.password,
    required this.username,
    required this.department,
    required this.applicationstatus,
  });
}

class Logout extends AuthEvent {}
