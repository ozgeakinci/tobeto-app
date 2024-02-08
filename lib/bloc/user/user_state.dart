abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String username;
  final String department;
  final bool applicationStatus;
  final String greeting;
  final String usernameInitials;
  UserLoaded({
    required this.username,
    required this.department,
    required this.applicationStatus,
    required this.greeting,
    required this.usernameInitials,
  });
}

class UserError extends UserState {}
