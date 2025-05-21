import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/utils/theme_manager.dart';
import 'package:test/core/widget/custom_aweasome_dialog.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/view/HomePage/person_page/profile_list_item.dart';
import 'package:test/view/HomePage/person_page/show_language_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomAwesomeDialog customAweasomeDialog = CustomAwesomeDialog();

    List<String> text = [
      S.of(context).EditProfile,
      S.of(context).ChangeLanguage,
      S.of(context).ContactUs,
      S.of(context).ChatwithApp,
      S.of(context).Logout,
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
        GoRouter.of(context).push(AppRouter.kEditProfile);
      },
      () {
        // Handle change language
     
    showLanguageDialog(context);     
      },
      () {
        // Handle contact us
        GoRouter.of(context).push(AppRouter.kQRCodePage);
      },
      () {
        //chat with app
        GoRouter.of(context).push(AppRouter.kChatWithApp);
      },

      () {
        customAweasomeDialog.displayDialog(
          context: context,
          dialogType: DialogType.question,
          title: S.of(context).Are_You_Sure_you_want_to_logout,
          btnOkOnPress: () {
            GoRouter.of(context).push(AppRouter.kLoginPageForTourist);
          },
          btnCancelOnPress: () {},
        );
      },
    ];

    List<bool> hasNavigation = [true, true, true, true, false];

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
                  onTap: () {
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
           S.of(context).name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 5.h),
        Text(
            S.of(context).email,
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
        IconButton(
          icon: Directionality(
             textDirection: TextDirection.ltr,
            child: Icon(
              size: 30.sp,
              themeNotifier.value == ThemeMode.light
                  ? FontAwesome5Icon.moon
                  : FontAwesome5Icon.sun,
            ),
          ),
          onPressed: () {
            themeNotifier.value =
                themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          },
          color: Theme.of(context).iconTheme.color,
        ),
        SizedBox(width: 20.w),
        profileInfo,
        SizedBox(width: 20.w),
        Directionality(
           textDirection: TextDirection.rtl,
          child: IconButton(
            icon: Icon(Icons.person, size: 30.sp),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {},
          ),
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
                final animation = Tween<Offset>(
                  begin: const Offset(0, 1), // يبدأ من الأسفل
                  end: Offset.zero, // ينتهي في الوضع الطبيعي
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      (1 / text.length) * index,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                final fadeAnimation = Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      (1 / text.length) * index,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                return SlideTransition(
                  position: animation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: ProfileListItem(
                      hasNavigation: hasNavigation[index],
                      icon: icon[index],
                      text: text[index],
                      onTap: actions[index],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


