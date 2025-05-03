import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';

class Validation {
  // Email
  String? validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email.isEmpty) return 'Email is required';
    if (!emailRegex.hasMatch(email)) return 'Invalid email format';
    return null;
  }

  // Password
  String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? validateVerifyPassword(String password, String verifyPassword) {
    if (verifyPassword.isEmpty) return 'Please verify your password';
    if (password != verifyPassword) return 'Passwords do not match';
    return null;
  }

  // Names
  String? validateFirstName(String firstName) {
    if (firstName.isEmpty) return 'First name is required';
    return null;
  }

  String? validateLastName(String lastName) {
    if (lastName.isEmpty) return 'Last name is required';
    return null;
  }

  // Phone
  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return 'Phone number is required';
    return null;
  }

  // Other fields
  String? validateNationality(String nationality) {
    if (nationality.isEmpty) return 'Nationality is required';
    return null;
  }

  String? validateGender(String gender) {
    if (gender.isEmpty) return 'Gender is required';
    return null;
  }

  String? validateBirthDate(String birthDate) {
    if (birthDate.isEmpty) return 'Birthdate is required';
    return null;
  }

  String? validateImage(File? imageFile) {
    if (imageFile == null) return 'Profile image is required';
    return null;
  }

  // Handle Login
  void handleLogin(
    BuildContext context,
    String email,
    String password,
    String verifyPassword,
  ) {
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);
    final verifyPasswordError = validateVerifyPassword(
      password,
      verifyPassword,
    );

    if (emailError != null ||
        passwordError != null ||
        verifyPasswordError != null) {
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
        dialogBackgroundColor: Colors.white,
      ).show();
      return;
    }

    GoRouter.of(context).pushReplacement(AppRouter.kBottomNavBar);
  }

  // Handle Register
  void handleRegister({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String dateOfBirth,
    required String gender,
    required String nationality,
    required String experienceYears,
    required File? image,
  }) {
    final firstNameError = validateFirstName(firstName);
    final lastNameError = validateLastName(lastName);
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);
    final confirmPasswordError = validateVerifyPassword(
      password,
      confirmPassword,
    );
    final phoneError = validatePhoneNumber(phone);
    final genderError = validateGender(gender);
    final nationalityError = validateNationality(nationality);
    final dobError = validateBirthDate(dateOfBirth);
    final imageError = validateImage(image);

    if (firstNameError != null ||
        lastNameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null ||
        phoneError != null ||
        genderError != null ||
        nationalityError != null ||
        dobError != null ||
        imageError != null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Validation Error',
        desc:
            firstNameError ??
            lastNameError ??
            emailError ??
            passwordError ??
            confirmPasswordError ??
            phoneError ??
            genderError ??
            nationalityError ??
            dobError ??
            imageError,
        btnOkOnPress: () {},
        btnCancelOnPress: () {},
        btnOkColor: Colors.blue,
        transitionAnimationDuration: Duration(milliseconds: 500),
        dialogBorderRadius: BorderRadius.circular(40),
        dialogBackgroundColor: Colors.white,
      ).show();
      return;
    }

    // ✅ Registration successful
    GoRouter.of(context).pushReplacement(AppRouter.kBottomNavBar);
  }

  // Optional: separate photo-only error dialog
  void showPhotoValidationDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Validation Error',
      desc: "Please enter a photo.",
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      transitionAnimationDuration: Duration(milliseconds: 500),
      dialogBorderRadius: BorderRadius.circular(40),
      dialogBackgroundColor: Colors.white,
    ).show();
  }
}
