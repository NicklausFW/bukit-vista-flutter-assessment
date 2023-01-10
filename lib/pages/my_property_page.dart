import 'package:bukit_vista_flutter_assessment/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPropertyPage extends StatefulWidget {
  const MyPropertyPage({Key? key}) : super(key: key);

  @override
  State<MyPropertyPage> createState() => _MyPropertyPageState();
}

class _MyPropertyPageState extends State<MyPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "My Property",
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.question_circle),
          ),
        ],
      ),
      body: Center(
        child: Text("My Property"),
      ),
    );
  }
}
