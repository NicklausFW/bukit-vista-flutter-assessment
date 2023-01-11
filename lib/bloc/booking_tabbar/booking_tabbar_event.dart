part of 'booking_tabbar_bloc.dart';

abstract class BookingTabBarEvent extends Equatable {
  const BookingTabBarEvent();
  @override
  List<Object?> get props => [];
}

class SelectTabBarIndexEvent extends BookingTabBarEvent {
  final int currentTabBarIndex;

  SelectTabBarIndexEvent(this.currentTabBarIndex);
}
