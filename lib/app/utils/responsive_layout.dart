import 'package:flutter/widgets.dart';

class ResponsiveLayout {
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

