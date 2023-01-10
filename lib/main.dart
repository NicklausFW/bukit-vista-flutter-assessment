import 'package:bukit_vista_flutter_assessment/constants/screen_pages.dart';
import 'package:bukit_vista_flutter_assessment/pages/booking_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
