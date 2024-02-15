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
  String? urlImage;

  UserLoaded(
      {required this.username,
      required this.department,
      required this.applicationStatus,
      required this.greeting,
      required this.usernameInitials,
      required this.email,
      required this.about,
      required this.birthDate,
      this.phoneNumber,
      this.urlImage});
}

class UserError extends UserState {}
