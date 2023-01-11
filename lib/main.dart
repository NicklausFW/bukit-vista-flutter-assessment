import 'package:bukit_vista_flutter_assessment/bloc/booking_tabbar_details/booking_tabbar_details_bloc.dart';
import 'package:bukit_vista_flutter_assessment/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/booking_tabbar/booking_tabbar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingTabBarBloc>(
            create: (context) => BookingTabBarBloc()),
        // BlocProvider<BookingTabBarDetailsBloc>(
        //     create: (context) => BookingTabBarDetailsBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
