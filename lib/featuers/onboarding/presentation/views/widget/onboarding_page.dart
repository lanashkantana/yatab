  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/utils/assets.dart';
import 'package:test/core/utils/color.dart';
import 'package:test/core/widget/custom_button.dart';


  class OnboardingPage extends StatefulWidget {
    const OnboardingPage({super.key});

    @override
    State<OnboardingPage> createState() => _OnboardingPageState();
  }

  class _OnboardingPageState extends State<OnboardingPage> {
    List title=["Life is short and the world is ",
    "It's a big world out there go ",
    "Your dream holiday is "

    ];
    List subtitle=["wide","explore","waiting"];
    List desc=["At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations ",
    "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
  "To get the best of your adventure you just need to leave and go where you like. we are waiting for you"
    
    
    ];
    List images=[AssetsData.onBoarding1,
    AssetsData.onBoarding2,
    AssetsData.onBoarding3
    
    
    ];
    List textbut=["Get Started","Next","Next"];
    PageController controller=PageController();
    @override
    Widget build(BuildContext context) {
      return  PageView.builder(
        itemCount: images.length,
        controller: controller,
  itemBuilder: (BuildContext context, int index) { 
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [

  Image.asset(images[index],width: 375.w,height: 430.h,fit: BoxFit.fill,),
  SizedBox(height: 40.h,),


  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 40.w),
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
      TextSpan(
        text: subtitle[index],
        style: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold
        ),
      ),
    ],
  ),
),


  ),
  SizedBox(height: 12.h,),
  Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
  child:  Text(desc[index],textAlign: TextAlign.center
  ,style: TextStyle(color: AppColors.lightgrey
  ,fontSize: 16.sp,fontWeight: FontWeight.w500),),

  ),
 SizedBox(height: 23.h,),

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
  SizedBox(height: 38.h,),
  CustomButton(
  text: textbut[index],
  ontap: () {
    if (index < images.length - 1) {
      controller.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.kChoosePage);
    }
  },
),
    ],);


  },
      );
    }
  }