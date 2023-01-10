import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        // var items = snapshot.data as List<Guest>;
        var items = snapshot.data as List;

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items == null ? 0 : items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 100,
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff0a9f77)),
                            child: Center(
                              child: Text(
                                "15 NOV",
                                textAlign: TextAlign.center,
                              ),
                            )
                            // Image(
                            //   image:
                            //       NetworkImage(items[index].imageUrl.toString()),
                            //   fit: BoxFit.fill,
                            // ),
                            ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.chat_bubble_outline_sharp,
                                      size: 12, color: Colors.black),
                                ),
                                TextSpan(
                                  text: "12",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                items[index].name.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                items[index].country.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
