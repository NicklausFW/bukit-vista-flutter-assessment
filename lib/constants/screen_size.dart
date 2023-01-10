import 'package:flutter/cupertino.dart';

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context) : assert(context != null);

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
}
