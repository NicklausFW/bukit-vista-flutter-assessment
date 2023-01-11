import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_tabbar_details_event.dart';
part 'booking_tabbar_details_state.dart';

class BookingTabBarDetailsBloc
    extends Bloc<BookingTabBarDetailsEvent, BookingTabBarDetailsState> {
  BookingTabBarDetailsBloc() : super(BookingTabBarDetailsInitial()) {
    on<BookingTabBarDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
