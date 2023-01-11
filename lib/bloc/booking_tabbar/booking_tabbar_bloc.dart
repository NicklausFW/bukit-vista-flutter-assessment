import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_tabbar_event.dart';
part 'booking_tabbar_state.dart';

class BookingTabBarBloc extends Bloc<BookingTabBarEvent, BookingTabBarState> {
  BookingTabBarBloc() : super(BookingTabBarInitial()) {
    on<SelectTabBarIndexEvent>((event, emit) {
      // TODO: implement event handler
      emit(state is BookingTabBarSelected
          ? BookingTabBarSelected(state.currentTabBarIndex)
          : BookingTabBarSelected(state.currentTabBarIndex));
    });
  }
}
