import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAwesomeDialog {
  void displayDialog({
    required BuildContext context,
     DialogType? dialogType,
    required String title,
    String? desc,
    VoidCallback? btnOkOnPress,
    VoidCallback? btnCancelOnPress,
  }) {
    // Determine text color based on the current theme
    Color textColor =
        Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;

    AwesomeDialog(
      context: context,
      dialogType: dialogType!,
      animType: AnimType.bottomSlide,
      title: title,
      desc: desc,
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: btnCancelOnPress,

      btnOkColor: Colors.blue,
      transitionAnimationDuration: Duration(milliseconds: 500),
      dialogBorderRadius: BorderRadius.circular(40),
      dialogBackgroundColor: Colors.grey,

      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20.sp,
      ), // Set title text color
      descTextStyle: TextStyle(
        color: textColor,
        fontSize: 20.sp,
      ), // Set description text color
    ).show();
  }
}
