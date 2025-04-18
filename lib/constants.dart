import 'package:flutter/material.dart';

class Constants {
  static const kTransitionDuration = Duration(milliseconds: 250);
  static const kGtSectraFine = 'Lora';
   static const kPrimaryColor = Colors.white;

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
