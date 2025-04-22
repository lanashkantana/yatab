import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/utils/app_color.dart';


class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
     this.prefixIcon,
    required this.controller,
    required this.keyboardType,
    this.labelText,
    this.labelStyle,
    this.suffixIcon,
    this.fillColor,
    this.hintStyle,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.onChanged,
  });

  final String hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: widget.validator,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(25),
          filled: false,
          fillColor: widget.fillColor ?? const Color(0xFFD9D9D9),
          labelStyle:
              widget.labelStyle ??
              TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          hintStyle:
              widget.hintStyle ??
              TextStyle(color: AppColors.black, fontSize: 13.sp),
          prefixIcon: widget.prefixIcon,
          enabledBorder: _outlineInputBorder(),
          border: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: Colors.black, width: 1.3.w),
    );
  }
}