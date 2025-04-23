import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_flutter/icons_flutter.dart';

class CustomAppbar extends StatelessWidget {
  final Text? title;
  final VoidCallback? onPressed;

  const CustomAppbar({super.key, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: title,
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 37, 31, 31),
          fontSize: 25.sp,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            FontAwesome5Icon.arrow_left,
            size: 25.sp,
            color: const Color.fromARGB(255, 37, 31, 31),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
