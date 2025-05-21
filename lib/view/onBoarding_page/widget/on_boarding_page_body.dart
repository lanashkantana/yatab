import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/generated/l10n.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
 
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
     List title = [
    S.of(context).Life_is_short_and_the_world_is,
    S.of(context).It_big_world_out_there_go,
    S.of(context).Your_dream_holiday_is,
  ];
  List subtitle = [S.of(context).wide, S.of(context).explore, S.of(context).waiting];
  List desc = [
    S.of(context).desc_onbarding1,
    S.of(context).desc_onbarding2,
    S.of(context).desc_onbarding2,
  ];
  List images = [
    AssetsData.onBoarding1,
    AssetsData.onBoarding2,
    AssetsData.onBoarding3,
  ];
  List textbut = [S.of(context).get_Started,S.of(context).next,S.of(context).next];
    return PageView.builder(
      itemCount: images.length,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              images[index],
              width: 375.w,
              height: 430.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 40.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: title[index]),
                    ///اريد اضافة مساحة  بالعرض sizedbox(width:5)
                     WidgetSpan(
      child: SizedBox(width: 5.w), // 👈 هنا المسافة العرضية المطلوبة
    ),
                    TextSpan(
                      text: subtitle[index],
                      style: TextStyle(
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                desc[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightgrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 23.h),

            SmoothPageIndicator(
              controller: controller,
              count: images.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 12,
                dotHeight: 9,
                dotColor: Colors.grey,
                activeDotColor: AppColors.lightBlue,
                expansionFactor: 3,
                spacing: 5,
              ),
            ),
            SizedBox(height: 38.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                text: textbut[index],
                ontap: () {
                  if (index < images.length - 1) {
                    controller.animateToPage(
                      index + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRouter.kSelectionPage);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
