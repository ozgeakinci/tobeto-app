abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String username;
  final String department;
  final bool applicationStatus;
  UserLoaded({
    required this.username,
    required this.department,
    required this.applicationStatus,
  });
}

class UserError extends UserState {}
