import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      "Edit Profile",
      "Change Password",
      "Change Language",
      "Contact Us",
      "Invite a Friend",
      "Logout",
    ];

    List<IconData> icon = [
      FontAwesome5Icon.user,
      FontAwesome5Icon.lock,
      FontAwesome5Icon.language,
      FontAwesome5Icon.question_circle,
      FontAwesome5Icon.user_plus,
      FontAwesome5Icon.sign_out_alt,
    ];

    List<bool> hasNavigation = [true, true, true, true, true, false];

    var profileInfo = Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 35.h),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AssetsData.onBoarding1),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 27.h,
                  width: 27.w,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(FontAwesome5Icon.pen, size: 18.sp),
                    onPressed: () {},
                    color: Color(0xff333333),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          "Lana Shkantana",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 5.h),
        Text(
          "lanaqitt@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: Colors.black54,
          ),
        ),
      ],
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 20.w),
        IconButton(
          icon: Icon(FontAwesome5Icon.arrow_left, size: 30.sp),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kBottomNavBar);
          },
          color: const Color(0xff333333),
        ),

        profileInfo,
        IconButton(
          icon: Icon(FontAwesome5Icon.moon, size: 30.sp),
          onPressed: () {},
          color: const Color(0xff333333),
        ),
        SizedBox(width: 20.w),
      ],
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            SizedBox(height: 20.h),
            header,
            ListView.builder(
              itemCount: text.length,
              shrinkWrap:
                  true, // To prevent ListView from taking infinite height
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling for ListView
              itemBuilder: (BuildContext context, int index) {
                return ProfileListItem(
                  hasNavigation: hasNavigation[index],
                  icon: icon[index],
                  text: text[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final bool hasNavigation;

  const ProfileListItem({
    super.key,
    required this.hasNavigation,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        hoverColor: AppColors.orange,
        focusColor: AppColors.orange,
        onTap: () {},
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 111, 111, 105),
          ),
          child: Row(
            children: [
              IconButton(icon: Icon(icon, size: 20.sp), onPressed: () {}),
              SizedBox(width: 15.w),
              Text(
                text ?? '',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
              Spacer(),
              if (hasNavigation)
                IconButton(
                  icon: Icon(LineAwesomeIcons.angle_right_solid, size: 22.sp),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
