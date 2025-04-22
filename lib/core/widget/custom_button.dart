import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/utils/app_color.dart';


class CustomButton extends StatelessWidget {
final String text;
final GestureTapCallback ontap;



  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
child: InkWell(
onTap: ontap,
child: Container(
  decoration: BoxDecoration(
    
    color: AppColors.lightBlue,
    

    borderRadius: BorderRadius.circular(35)),


height: 60.h,

child: Center(child: Text(text,style:TextStyle(color:  Colors.white,fontSize:20 ))),

),

),

);
  }
}