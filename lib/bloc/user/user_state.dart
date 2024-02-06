abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String username;
  final String department;
  UserLoaded({
    required this.username,
    required this.department,
  });
}
