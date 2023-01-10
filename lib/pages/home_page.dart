import 'package:bukit_vista_flutter_assessment/constants/color_palette.dart';
import 'package:bukit_vista_flutter_assessment/constants/screen_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPages.screens[ScreenPages.currentNavigationBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff1076bc),
        unselectedItemColor: Colors.grey,
        iconSize: 20,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: ScreenPages.currentNavigationBarIndex,
        onTap: (index) => setState(
          () => ScreenPages.currentNavigationBarIndex = index,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.home),
            label: 'My Property',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.list_alt),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.wallet),
            label: 'Accounting',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.bell),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.user),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
