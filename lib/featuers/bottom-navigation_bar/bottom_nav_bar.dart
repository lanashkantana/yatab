import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:test/core/utils/color.dart';
import 'package:test/featuers/favourite_page.dart';
import 'package:test/featuers/home_page.dart';
import 'package:test/featuers/hotel_page.dart';
import 'package:test/featuers/person_page.dart';
import 'package:test/featuers/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final items = <Widget>[
    Icon(FontAwesome5Icon.home, size: 24.sp),
    Icon(FontAwesome5Icon.search, size: 24.sp),
    Icon(FontAwesome5Icon.heart, size: 30.sp, color: Colors.red),
    Icon(FontAwesome5Icon.hotel, size: 24.sp),
    Icon(Ionicons.md_person, size: 24.sp),
  ];
  final screens = <Widget>[
    HomePage(),
    SearchPage(),
    FavouritePage(),
    HotelPage(),
    PersonPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Theme(
          data: Theme.of(
            context,
          ).copyWith(iconTheme: IconThemeData(color: AppColors.black)),
          child: CurvedNavigationBar(
            items: items,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColors.lightgrey,
            index: index,
            height: 59.h,
            animationCurve: Curves.easeIn,
            animationDuration: Duration(milliseconds: 300),
            onTap: (int selectedIndex) {
              setState(() {
                index = selectedIndex;
              });
            },
            color: AppColors.BeigeLight,
          ),
        ),
        body: screens[index],
      ),
    );
  }
}
