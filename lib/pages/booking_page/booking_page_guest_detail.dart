import 'package:bukit_vista_flutter_assessment/constants/booking_tabbar.dart';
import 'package:bukit_vista_flutter_assessment/constants/color_palette.dart';
import 'package:bukit_vista_flutter_assessment/constants/screen_size.dart';
import 'package:bukit_vista_flutter_assessment/models/guest_list_model.dart';
import 'package:bukit_vista_flutter_assessment/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPageGuestDetail extends StatefulWidget {
  Guest guest;
  final Function? callbackFunction;

  BookingPageGuestDetail({required this.guest, this.callbackFunction});

  @override
  State<BookingPageGuestDetail> createState() => _BookingPageGuestDetailState();
}

class _BookingPageGuestDetailState extends State<BookingPageGuestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            widget.callbackFunction!(false, null);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.question_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: ScreenSize(context).screenHeight * 0.01),
              child: Container(
                height: ScreenSize(context).screenHeight * 0.16,
                padding:
                    EdgeInsets.all(ScreenSize(context).screenHeight * 0.02),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: ScreenSize(context).screenHeight * 0.1,
                      width: ScreenSize(context).screenHeight * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.guest.imageUrl.toString()),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: ScreenSize(context).screenWidth * 0.04,
                            right: ScreenSize(context).screenHeight * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      ScreenSize(context).screenHeight * 0.015),
                              child: Text(
                                widget.guest.name.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenSize(context).screenHeight * 0.01),
                              child: Text(
                                widget.guest.country.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize(context).screenHeight * 0.015,
                            ),
                            Container(
                              width: ScreenSize(context).screenWidth * 0.2,
                              height: ScreenSize(context).screenHeight * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(CupertinoIcons.star_fill,
                                            size: 11, color: Colors.green),
                                      ),
                                      TextSpan(
                                        text: " Repeater",
                                        style: GoogleFonts.roboto(
                                            fontSize: 8,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenSize(context).screenHeight * 0.001),
              child: Container(
                width: ScreenSize(context).screenWidth,
                height: ScreenSize(context).screenHeight * 0.08,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: ScreenSize(context).screenWidth,
                        height: ScreenSize(context).screenHeight * 0.07,
                        child: ListView.builder(
                          itemCount: BookingTabBar.tabBarItemsDetails.length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  BookingTabBar.currentTabBarDetailsIndex =
                                      index;
                                });
                              },
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize(context).screenWidth *
                                          0.08,
                                      right: ScreenSize(context).screenWidth *
                                          0.3),
                                  child: Text(
                                    BookingTabBar.tabBarItemsDetails[index],
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: BookingTabBar
                                                  .currentTabBarDetailsIndex ==
                                              index
                                          ? Color(0xff1076bc)
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 100),
                      bottom: 0,
                      left: BookingTabBar.currentTabBarDetailsIndex == 0
                          ? ScreenSize(context).screenWidth * 0.001
                          : ScreenSize(context).screenWidth * 0.5,
                      child: AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 500),
                        width: ScreenSize(context).screenWidth * 0.5,
                        height: ScreenSize(context).screenHeight * 0.005,
                        decoration: BoxDecoration(
                          color: Color(0xff1076bc),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BookingTabBar.currentTabBarDetailsIndex == 0
                ? Container()
                : SizedBox(
                    width: ScreenSize(context).screenWidth,
                    height: ScreenSize(context).screenHeight,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize(context).screenHeight * 0.001),
                          child: Container(
                            width: ScreenSize(context).screenWidth,
                            height: ScreenSize(context).screenHeight * 0.15,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize(context).screenWidth *
                                          0.05),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Check in",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize(context).screenWidth *
                                                0.01,
                                      ),
                                      Text(
                                        widget.guest.checkInTime.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize(context).screenWidth *
                                                0.01,
                                      ),
                                      Text(
                                        widget.guest.checkInDate.toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesome5.moon,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      height: ScreenSize(context).screenWidth *
                                          0.01,
                                    ),
                                    Text(
                                      "${widget.guest.nights.toString()} Nights",
                                      style: GoogleFonts.roboto(
                                        fontSize: 10,
                                        color: Color(0xff1076bc),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: ScreenSize(context).screenWidth *
                                          0.05),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Check out",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize(context).screenWidth *
                                                0.01,
                                      ),
                                      Text(
                                        widget.guest.checkOutTime.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize(context).screenWidth *
                                                0.01,
                                      ),
                                      Text(
                                        widget.guest.checkOutDate.toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize(context).screenHeight * 0.001),
                          child: Container(
                            width: ScreenSize(context).screenWidth,
                            height: ScreenSize(context).screenHeight * 0.28,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              ScreenSize(context).screenWidth *
                                                  0.05),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Booking ID",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize(context)
                                                    .screenWidth *
                                                0.01,
                                          ),
                                          RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${widget.guest.bookingId.toString()} ",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Icon(Icons.file_copy,
                                                      size: 10,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              ScreenSize(context).screenWidth *
                                                  0.05),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Booking status",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize(context)
                                                    .screenWidth *
                                                0.01,
                                          ),
                                          Text(
                                            widget.guest.bookingStatus
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              ScreenSize(context).screenWidth *
                                                  0.05),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Number of guest",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize(context)
                                                    .screenWidth *
                                                0.01,
                                          ),
                                          Text(
                                            widget.guest.numberOfGuest!,
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              ScreenSize(context).screenWidth *
                                                  0.05),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Booking value",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize(context)
                                                    .screenWidth *
                                                0.01,
                                          ),
                                          Text(
                                            widget.guest.bookingValue
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              ScreenSize(context).screenWidth *
                                                  0.05),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Phone number",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize(context)
                                                    .screenWidth *
                                                0.01,
                                          ),
                                          RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${widget.guest.phoneNumber.toString()} ",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Icon(
                                                      CupertinoIcons.phone,
                                                      size: 10,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenSize(context).screenHeight * 0.03,
                            left: ScreenSize(context).screenWidth * 0.05,
                            bottom: ScreenSize(context).screenHeight * 0.03,
                          ),
                          child: Text(
                            "Hosting details",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize(context).screenHeight * 0.001),
                          child: Container(
                            width: ScreenSize(context).screenWidth,
                            height: ScreenSize(context).screenHeight * 0.3,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenSize(context).screenWidth * 0.05,
                                  top: ScreenSize(context).screenHeight * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// host
                                  Text(
                                    "Host",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.01,
                                  ),
                                  Text(
                                    "${widget.guest.hostingDetails!.host.toString()} ",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.02,
                                  ),

                                  /// profile name
                                  Text(
                                    "Profile",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.01,
                                  ),
                                  Text(
                                    "${widget.guest.hostingDetails!.profileName.toString()} ",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.02,
                                  ),

                                  /// property unit
                                  Text(
                                    "Property unit",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.01,
                                  ),
                                  Text(
                                    "${widget.guest.hostingDetails!.propertyUnit.toString()} ",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.02,
                                  ),

                                  /// listing name
                                  Text(
                                    "Listing name",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenSize(context).screenWidth * 0.01,
                                  ),
                                  Text(
                                    "${widget.guest.hostingDetails!.listingName.toString()} ",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: Color(0xfff69322),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// add space to bottom
                        SizedBox(
                          height: ScreenSize(context).screenHeight * 0.55,
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
