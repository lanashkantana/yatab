import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.logo, width: 220.w),
            SizedBox(height: 20.h),
            Text(
              "Time To Start To Create Your Accounnt",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "choose you'r Catagory :",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "Guide",
              ontap: () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRouter.kRegisterPageForGuide);
              },
            ),
            SizedBox(height: 20.h),

            CustomButton(
              text: "Tourist",
              ontap: () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRouter.kRegisterPageForTourist);
              },
            ),

            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
