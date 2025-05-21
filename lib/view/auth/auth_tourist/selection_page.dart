import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/generated/l10n.dart';
class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
 bool isArabic() {
  return Localizations.localeOf(context).languageCode == 'ar';
}

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
              S.of(context).Time_To_Start_To_Create_Your_Accounnt,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: isArabic()? EdgeInsets.only(right: 20)
              :
              EdgeInsets.only(left: 20),
              child: Align(
               alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,

                child: Text(
                  "${S.of(context).choose_you_Catagory} :",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text:  S.of(context).Guide,
              ontap: () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRouter.kRegisterPageForGuide);
              },
            ),
            SizedBox(height: 20.h),

            CustomButton(
              text:  S.of(context).Tourist,
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
