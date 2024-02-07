abstract class BottomNavbarEvent {}

class UpdatePageIndexEvent extends BottomNavbarEvent {
  final int index;

  UpdatePageIndexEvent(this.index);
}
