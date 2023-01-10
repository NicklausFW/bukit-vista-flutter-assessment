import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.actions,
  });
  final Text title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff1076bc),
      centerTitle: true,
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
