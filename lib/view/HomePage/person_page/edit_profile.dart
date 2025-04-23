import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/core/utils/app_color.dart';
import 'package:test/core/widget/custom_appBar.dart';
import 'package:test/core/widget/custom_aweasome_dialog.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/view/auth/register_form.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
      TextEditingController(); // Optional
  final TextEditingController verifyPasswordController =
      TextEditingController(); // Optional
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData(); // Load saved data when the page initializes
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';
      phoneNumberController.text = prefs.getString('phone') ?? '';
      dateController.text = prefs.getString('dateOfBirth') ?? '';
      genderController.text = prefs.getString('gender') ?? '';
      nationalityController.text = prefs.getString('nationality') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(
                title: Text("Edit Profile"),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
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
                      SizedBox(height: 20.h),
                      RegistrationForm(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        passwordController: passwordController, // Optional
                        verifyPasswordController:
                            verifyPasswordController, // Optional
                        phoneNumberController: phoneNumberController,
                        dateController: dateController,
                        genderController: genderController,
                        nationalityController: nationalityController,
                      ),
                      CustomButton(
                        text: "Update",
                        ontap: () {
                          GoRouter.of(context).pop();
                        },
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
