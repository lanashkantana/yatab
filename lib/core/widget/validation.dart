import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';

class Validation {
  String? validateEmail(String email) {
    // Regular expression for validating email
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null; // Valid email
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null; // Valid password
  }

  String? validateVerifyPassword(String password, String verifyPassword) {
    if (verifyPassword.isEmpty) {
      return 'Please verify your password';
    } else if (password != verifyPassword) {
      return 'Passwords do not match';
    }
    return null; // Valid verify password
  }

 void handleLogin(BuildContext context, String email, String password, String verifyPassword) {
  final emailError = validateEmail(email);
  final passwordError = validatePassword(password);
  final verifyPasswordError = validateVerifyPassword(password, verifyPassword);

  if (emailError != null || passwordError != null || verifyPasswordError != null) {
    // ❌ لا تستخدم showDialog ولا BackdropFilter
    // ✅ استخدم AwesomeDialog مباشرة
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Validation Error',
      desc: emailError ?? passwordError ?? verifyPasswordError,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      transitionAnimationDuration: Duration(milliseconds: 500),
      dialogBorderRadius: BorderRadius.circular(40),
      // لو حاب تأثير ضبابي خفيف:
      dialogBackgroundColor: Colors.white
    ).show();

    return;
  }

  GoRouter.of(context).pushReplacement(AppRouter.kBottomNavBar);
}

   
}