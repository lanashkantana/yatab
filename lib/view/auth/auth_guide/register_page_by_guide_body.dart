import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_text_field.dart';
import 'package:test/core/widget/validation.dart';
import 'package:test/view/auth/register_form.dart';

class RegisterPageForGuideBody extends StatefulWidget {
  const RegisterPageForGuideBody({super.key});

  @override
  State<RegisterPageForGuideBody> createState() => _RegisterPageForGuideBodyState();
}

class _RegisterPageForGuideBodyState extends State<RegisterPageForGuideBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController yearOfExperienceController = TextEditingController();

  final Validation validation = Validation();
  final GlobalKey<RegistrationFormState> formKey = GlobalKey<RegistrationFormState>();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
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
    yearOfExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 40.sp, color: AppColors.white),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Create account for Guide",
                      style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                    ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Registration Form
                      RegistrationForm(
                        key: formKey, // ✅ Pass key to access image
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
                      10.verticalSpace,
                      // Experience Field
                      CustomFormTextField(
                        keyboardType: TextInputType.number,
                        controller: yearOfExperienceController,
                        obscureText: false, // ✅ Fixed
                        prefixIcon: Icon(Icons.calendar_today_outlined, color: Color(0xFF002E53)),
                        labelText: "Years of Experience",
                        hintText: "Enter your experience years",
                      ),
                      20.verticalSpace,
                      // Register Button
                      CustomButton(
                        text: "Register",
                        ontap: () {
                          final formState = formKey.currentState;
                          File? selectedImage = formState?.selectedImage;

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
                            image: selectedImage, // ✅ Pass image for validation
                          );
                        },
                      ),
                      18.verticalSpace,
                      // Switch to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kLoginPageForGuide);
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
                      20.verticalSpace,
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
