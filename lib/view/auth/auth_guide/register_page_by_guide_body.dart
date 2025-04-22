
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
  bool obscureText = false;
  bool obsecureTextReapet = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  //
 final TextEditingController yearOfExperienceController = TextEditingController();
  
   




  final Validation validation = Validation();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.text = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
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
                    "Create account for Guide",
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Choose photo
                 10.verticalSpace,
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
               



  CustomFormTextField(
          keyboardType: TextInputType.number,
          controller: yearOfExperienceController,
          obscureText: obsecureTextReapet,
          prefixIcon: Icon(Icons.date_range_outlined,
          
             color: Color(0xFF002E53),
          ),
         
          labelText: "years ",
          hintText: "years Of Experience",
        ),



                   
                    CustomButton(
                      text: "Register",
                      ontap: () {
                        validation.handleLogin(
                          context,
                          emailController.text,
                          passwordController.text,
                          verifyPasswordController.text,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}