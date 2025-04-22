import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';

import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_text_field.dart';
import 'package:test/core/widget/validation.dart';

class LoginPageForGuideBody extends StatefulWidget {
  const LoginPageForGuideBody({super.key});

  @override
  State<LoginPageForGuideBody> createState() => _LoginPageForGuideBodyState();
}

class _LoginPageForGuideBodyState extends State<LoginPageForGuideBody> {
  late bool obscureText = false;
  late bool obsecureTextReapet = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final Validation _validation = Validation();

  @override
  void dispose() {
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    emailController.dispose(); // Don't forget to dispose the email controller
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _toggleVisibilityReapeat() {
    setState(() {
      obsecureTextReapet = !obsecureTextReapet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ],
          ),
        ),
        child: SingleChildScrollView( // Ensure scrolling is enabled
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Login", style: TextStyle(fontSize: 40.sp,color: AppColors.white)),
                    SizedBox(height: 5.h),
                    Text("Welcome Again", style: TextStyle(fontSize: 20.sp,color: AppColors.white)),
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
                      Image.asset(AssetsData.logowithouttext, width: 150.w),
                      CustomFormTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        obscureText: false,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email_outlined,
                            color: const Color.fromARGB(255, 0, 46, 83),
                          ),
                        ),
                        labelText: "Email",
                       
                        hintText: "Enter your email",
                       
                      ),
                      SizedBox(height: 40.h),



                      CustomFormTextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.password_outlined,
                            color: const Color.fromARGB(255, 0, 46, 83),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromARGB(255, 0, 46, 83),
                          ),
                        ),
                        labelText: "Password",
                        hintText: "Enter your password",
                       
                       
                        obscureText: obscureText,
                     
                      ),
                      SizedBox(height: 40.h),



                      CustomFormTextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _verifyPasswordController,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.password_outlined,
                            color: const Color.fromARGB(255, 0, 46, 83),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibilityReapeat,
                          icon: Icon(
                            obsecureTextReapet ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromARGB(255, 0, 46, 83),
                          ),
                        ),
                        labelText: "Verify Password",
                        hintText: "Repeat password",
                       
                        
                        obscureText: obsecureTextReapet,
                        
                      ),
                      SizedBox(height: 40.h),









                      CustomButton(
                        text: "Login",
                        ontap: () {
                          _validation.handleLogin(
                            context,
                            emailController.text,
                            _passwordController.text,
                            _verifyPasswordController.text,
                          );
                        },
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account?", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 5.w),
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kRegisterPageForGuide);
                            },
                            child: Text("Register", style: TextStyle(color: AppColors.lightBlue,fontSize: 16,fontWeight: FontWeight.bold)),
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