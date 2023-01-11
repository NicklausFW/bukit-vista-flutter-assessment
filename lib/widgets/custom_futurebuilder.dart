import 'package:bukit_vista_flutter_assessment/constants/screen_size.dart';
import 'package:bukit_vista_flutter_assessment/models/guest_list_model.dart';
import 'package:bukit_vista_flutter_assessment/pages/booking_page/booking_page_guest_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFutureBuilder<T> extends StatefulWidget {
  CustomFutureBuilder({required this.future});
  final Future<T>? future;

  @override
  State<CustomFutureBuilder<T>> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      // future: readGuestJsonData(),
      future: widget.future,
      builder: (context, AsyncSnapshot<T> snapshot) {
        /// Check if property returns any error
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var items = snapshot.data as List<Guest>;
        // var items = snapshot.data as List;

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items == null ? 0 : items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(top: ScreenSize(context).screenHeight * 0.01),
              child: Container(
                height: ScreenSize(context).screenHeight * 0.22,
                padding:
                    EdgeInsets.all(ScreenSize(context).screenHeight * 0.02),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: ScreenSize(context).screenHeight * 0.07,
                            width: ScreenSize(context).screenHeight * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff0a9f77)),
                            child: Center(
                              child: Text(
                                "15 NOV",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                            // Image(
                            //   image:
                            //       NetworkImage(items[index].imageUrl.toString()),
                            //   fit: BoxFit.fill,
                            // ),
                            ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize(context).screenHeight * 0.01),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.chat_bubble_outline_sharp,
                                      size: 11, color: Colors.black),
                                ),
                                TextSpan(
                                  text: " 12",
                                  style: GoogleFonts.roboto(
                                    fontSize: 8,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: ScreenSize(context).screenWidth * 0.04,
                            right: ScreenSize(context).screenHeight * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ScreenSize(context).screenWidth * 0.45,
                              height: ScreenSize(context).screenHeight * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xfff69322),
                              ),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(FontAwesome5.bell,
                                            size: 11, color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: " CHECK ROOM FOR READINESS",
                                        style: GoogleFonts.roboto(
                                            fontSize: 8,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      ScreenSize(context).screenHeight * 0.015),
                              child: Text(
                                items[index].name.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenSize(context).screenHeight * 0.01),
                              child: Text(
                                items[index].accommodation.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize(context).screenHeight * 0.01,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        ScreenSize(context).screenHeight * 0.05,
                                    width:
                                        ScreenSize(context).screenWidth * 0.01,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize(context).screenWidth * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Is the room ready for guest arrival?",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            ScreenSize(context).screenHeight *
                                                0.01,
                                      ),
                                      Text(
                                        "YES",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPageGuestDetail(
                              items![index],
                            ),
                          ),
                        );
                      },
                      child: Center(
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
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
