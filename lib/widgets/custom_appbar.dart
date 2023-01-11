import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.actions,
    this.leadingIconButton,
  });
  final Text title;
  final List<Widget> actions;
  final IconButton? leadingIconButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingIconButton,
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
