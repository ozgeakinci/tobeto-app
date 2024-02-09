abstract class BottomNavBarState {}

class BottomNavbarUpdate extends BottomNavBarState {
  final int currentIndex;

  BottomNavbarUpdate(this.currentIndex);
}
