import 'package:bukit_vista_flutter_assessment/constants/booking_tabbar.dart';
import 'package:bukit_vista_flutter_assessment/constants/color_palette.dart';
import 'package:bukit_vista_flutter_assessment/constants/screen_size.dart';
import 'package:bukit_vista_flutter_assessment/models/guest_list_model.dart';
import 'package:bukit_vista_flutter_assessment/view_controllers/guest_controller.dart';
import 'package:bukit_vista_flutter_assessment/widgets/custom_appbar.dart';
import 'package:bukit_vista_flutter_assessment/widgets/custom_futurebuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("START DATE"), Text("10 NOV 2020")],
                  ),
                  Center(
                    child: Text(">"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("END DATE"), Text("16 NOV 2020")],
                  ),
                ],
              ),
              height: ScreenSize(context).screenHeight * 0.1,
              width: ScreenSize(context).screenWidth,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
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
                        margin: EdgeInsets.fromLTRB(0, 10, 8, 5),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
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
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Earlier"),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Refresh",
                      style: TextStyle(color: Color(0xfff69322)),
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
    );
  }
}
