import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/validation.dart';
import 'package:test/view/auth/register_form.dart';

///
class RegisterPageByTouristBody extends StatefulWidget {
  const RegisterPageByTouristBody({super.key});

  @override
  State<RegisterPageByTouristBody> createState() =>
      _RegisterPageByTouristBodyState();
}

class _RegisterPageByTouristBodyState extends State<RegisterPageByTouristBody> {
  bool obscureText = false;
  bool obsecureTextReapet = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController yearOfExperienceController =
      TextEditingController();

  final Validation validation = Validation();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.text =
        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
  }

  @override
  void dispose() {
    passwordController.dispose();
    verifyPasswordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumerController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void toggleVisibilityReapeat() {
    setState(() {
      obsecureTextReapet = !obsecureTextReapet;
    });
  }

  @override
  Widget build(BuildContext context) {
    File? selectedImage;
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 40.sp, color: AppColors.white),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Create account for Tourist",
                      style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // داخل build:
                      RegistrationForm(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        verifyPasswordController: verifyPasswordController,
                        phoneNumberController: phoneNumerController,
                        dateController: dateController,
                        genderController: genderController,
                        nationalityController: nationalityController,
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        text: "Register",
                        ontap: () {
                          validation.handleRegister(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: verifyPasswordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phone: phoneNumerController.text,
                            dateOfBirth: dateController.text,
                            gender: genderController.text,
                            nationality: nationalityController.text,
                            experienceYears: yearOfExperienceController.text,
                          );
                        },
                      ),

                      SizedBox(height: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 5.w),
                          InkWell(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kLoginPageForTourist);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
