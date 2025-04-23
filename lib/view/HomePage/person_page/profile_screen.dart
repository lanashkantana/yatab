import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/utils/theme_manager.dart';
import 'package:test/core/widget/custom_aweasome_dialog.dart';
import 'package:test/view/HomePage/person_page/profile_list_item.dart'; // Import the theme notifier

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomAwesomeDialog customAweasomeDialog = CustomAwesomeDialog();
    List<String> text = [
      "Edit Profile",

      "Change Language",
      "Contact Us",
      "Invite a Friend",
      "Logout",
    ];

    List<IconData> icon = [
      FontAwesome5Icon.user,

      FontAwesome5Icon.language,
      FontAwesome5Icon.question_circle,
      FontAwesome5Icon.user_plus,
      FontAwesome5Icon.sign_out_alt,
    ];
    List<VoidCallback> actions = [
      () {
        // Handle edit profile
        GoRouter.of(context).push(AppRouter.kEditProfile);
        // Navigate to edit profile screen or show a dialog
      },

      () {
        // Handle change language
        print("Change Language tapped");
        // Show language options
      },
      () {
        // Handle contact us
        print("Contact Us tapped");
        // Navigate to contact us screen or show a dialog
      },
      () {
        // Handle invite a friend
        print("Invite a Friend tapped");
        // Show share options
      },
      () {
        // Handle logout

        customAweasomeDialog.displayDialog(
          context: context,
          dialogType: DialogType.question,
          title: "Are You Sure you want to logout",
          btnOkOnPress: () {
            GoRouter.of(context).push(AppRouter.kLoginPageForTourist);
          },
          btnCancelOnPress: () {},
        );

        // Perform logout action
      },
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
                child: InkWell(
                  onTap: (){
                        GoRouter.of(context).push(AppRouter.kEditProfile);
                  },
                  child: Container(
                    height: 30.h,
                    width: 27.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(FontAwesome5Icon.pen, size: 18.sp),
                      onPressed: () {},
                      color: const Color(0xff333333),
                    ),
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ],
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 20.w),

        /// 🌞 Light mode
        IconButton(
          icon: Icon(FontAwesome5Icon.sun, size: 30.sp),
          onPressed: () {
            themeNotifier.value = ThemeMode.light;
          },
          color: Theme.of(context).iconTheme.color,
        ),

        profileInfo,

        /// 🌙 Dark mode
        IconButton(
          icon: Icon(FontAwesome5Icon.moon, size: 30.sp),
          onPressed: () {
            themeNotifier.value = ThemeMode.dark;
          },
          color: Theme.of(context).iconTheme.color,
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ProfileListItem(
                  hasNavigation: hasNavigation[index],
                  icon: icon[index],
                  text: text[index],
                  onTap: actions[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


