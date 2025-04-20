import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test/core/utils/color.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatefulWidget {
   CustomFormTextField({
    super.key,
  required  this.hintText,
    this.onChanged,
   required this.obscureText ,
    this.labelText,
    this.labelStyle,
    this.suffixIcon, 
    this.fillColor,
     this.hintStyle,
  required    this.prefixIcon,
     required this.controller,
     required this.keyboardType,
     this.readOnly=false,
     this.onTap
    
    
  });

  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
   bool obscureText=false; // Changed to non-nullable
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final Color?fillColor;
   Widget?prefixIcon;
final TextStyle?hintStyle;
 TextEditingController? controller = TextEditingController();
 final TextInputType keyboardType;
 final bool readOnly;
final VoidCallback? onTap;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child: TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
      obscureText: widget.obscureText, 
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        
        
        
        contentPadding: EdgeInsets.all(25),
        filled: false,
            fillColor: const Color(0xFFD9D9D9),
                        labelStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
        labelText: widget.labelText,
      
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
         hintStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                        ),
        prefixIcon:widget.prefixIcon,
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    ),
    
    
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide( 
      color:Colors.black,
      width:1.3.w,
      ),
    );
  }
}