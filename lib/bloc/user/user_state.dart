abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  String username;
  String department;
  final bool applicationStatus;
  final String greeting;
  final String usernameInitials;
  String email;
  String about;
  DateTime birthDate;
  int? phoneNumber;

  UserLoaded(
      {required this.username,
      required this.department,
      required this.applicationStatus,
      required this.greeting,
      required this.usernameInitials,
      required this.email,
      required this.about,
      required this.birthDate,
      this.phoneNumber});
}

class UserError extends UserState {}
