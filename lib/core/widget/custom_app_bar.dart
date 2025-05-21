import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:test/core/utils/app_style.dart';

AppBar buildAppBar({final String? title, final void Function()? onPressed,final List<Widget>? actions}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        FontAwesome5Icon.arrow_left,
        size: 25.sp,
        color: const Color.fromARGB(255, 37, 31, 31),
      ),
      onPressed: onPressed,
    ),
    centerTitle: true,
    elevation: 0,

    backgroundColor: Colors.transparent,
    title: Text(title ?? '', style: Styles.style25),
    actions: actions,
  );
}
