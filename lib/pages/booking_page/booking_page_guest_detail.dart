import 'package:bukit_vista_flutter_assessment/constants/booking_tabbar.dart';
import 'package:bukit_vista_flutter_assessment/constants/color_palette.dart';
import 'package:bukit_vista_flutter_assessment/constants/screen_pages.dart';
import 'package:bukit_vista_flutter_assessment/constants/screen_size.dart';
import 'package:bukit_vista_flutter_assessment/models/guest_list_model.dart';
import 'package:bukit_vista_flutter_assessment/view_controllers/guest_controller.dart';
import 'package:bukit_vista_flutter_assessment/widgets/custom_appbar.dart';
import 'package:bukit_vista_flutter_assessment/widgets/custom_futurebuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPageGuestDetail extends StatefulWidget {
  Guest guest;

  BookingPageGuestDetail(this.guest);

  @override
  State<BookingPageGuestDetail> createState() => _BookingPageGuestDetailState();
}

class _BookingPageGuestDetailState extends State<BookingPageGuestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: CustomAppBar(
        title: Text(
          "Booking",
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingIconButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.question_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSize(context).screenWidth * 0.05),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "START DATE",
                            style: GoogleFonts.roboto(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "10 NOV 2020",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        "›",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: ScreenSize(context).screenWidth * 0.05),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "END DATE",
                            style: GoogleFonts.roboto(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "16 NOV 2020",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              height: ScreenSize(context).screenHeight * 0.1,
              width: ScreenSize(context).screenWidth,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: ScreenSize(context).screenWidth * 0.02),
              child: SizedBox(
                height: ScreenSize(context).screenHeight * 0.08,
                child: ListView.builder(
                  itemCount: BookingTabBar.tabBarItems.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          BookingTabBar.currentTabBarIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: BookingTabBar.currentTabBarIndex == index
                                ? Color(0xff1076bc)
                                : Colors.white,
                            border: Border.all(
                                color: BookingTabBar.currentTabBarIndex == index
                                    ? Colors.transparent
                                    : Color(0xff1076bc),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.fromLTRB(
                            0,
                            ScreenSize(context).screenHeight * 0.02,
                            ScreenSize(context).screenWidth * 0.02,
                            ScreenSize(context).screenHeight * 0.01),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(
                                ScreenSize(context).screenWidth * 0.01),
                            child: Text(
                              BookingTabBar.tabBarItems[index],
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: BookingTabBar.currentTabBarIndex == index
                                    ? Colors.white
                                    : Color(0xff1076bc),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize(context).screenHeight * 0.01,
                      bottom: ScreenSize(context).screenHeight * 0.01,
                      left: ScreenSize(context).screenWidth * 0.03),
                  child: Text(
                    "Earlier",
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize(context).screenHeight * 0.01,
                      bottom: ScreenSize(context).screenHeight * 0.01,
                      right: ScreenSize(context).screenWidth * 0.03),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Refresh",
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Color(0xfff69322),
                      ),
                    ),
                  ),
                )
              ],
            ),
            BookingTabBar.currentTabBarIndex == 0
                ? CustomFutureBuilder(
                    future: readGuestJsonData(),
                  )
                : Container(),
          ],
        ),
      ),
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
