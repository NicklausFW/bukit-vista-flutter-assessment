part of 'booking_tabbar_bloc.dart';

abstract class BookingTabBarState extends Equatable {
  final int currentTabBarIndex;

  const BookingTabBarState(this.currentTabBarIndex);
}

class BookingTabBarInitial extends BookingTabBarState {
  BookingTabBarInitial() : super(0);

  @override
  List<Object> get props => [];
}

class BookingTabBarSelected extends BookingTabBarState {
  BookingTabBarSelected(int currentTabBarIndex) : super(currentTabBarIndex);

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabBarIndex];
}
