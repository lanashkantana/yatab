import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:test/core/utils/color.dart';
import 'package:test/core/widget/custom_text_field.dart';
import 'package:test/featuers/regitser_page_for_tourist/features/view/widget/image_picker.dart';

class RegistrationForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final TextEditingController phoneNumberController;
  final TextEditingController dateController;
  final TextEditingController genderController;
  final TextEditingController nationalityController;

  const RegistrationForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.verifyPasswordController,
    required this.phoneNumberController,
    required this.dateController,
    required this.genderController,
    required this.nationalityController,
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool obscureText = false;
  bool obsecureTextReapet = false;
  DateTime selectedDate = DateTime.now();
    File? _selectedImage;

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
  Future<void> _pickImage() async {
    final pickedImage = await CustomImagePicker.chooseImageSource(context);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         InkWell(
                      onTap: _pickImage, // Call the method to pick an image
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color.fromARGB(255, 191, 194, 196),
                        backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                        child: _selectedImage == null
                            ? Text(
                                "Choose Your Photo",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColors.black),
                              )
                            : null,
                      ),
                    ),
                     SizedBox(height: 20.h),
        CustomFormTextField(
          keyboardType: TextInputType.text,
          controller: widget.firstNameController,
          obscureText: false,
          prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xFF002E53)),
          labelText: "First Name",
          hintText: "Enter your first name",
        ),
        10.verticalSpace,

        CustomFormTextField(
          keyboardType: TextInputType.text,
          controller: widget.lastNameController,
          obscureText: false,
          prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xFF002E53)),
          labelText: "Last Name",
          hintText: "Enter your last name",
        ),
        10.verticalSpace,

        CustomFormTextField(
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          obscureText: false,
          prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF002E53)),
          labelText: "Email",
          hintText: "Enter your email",
        ),
        10.verticalSpace,
        CustomFormTextField(
          keyboardType: TextInputType.visiblePassword,
          controller: widget.passwordController,
          obscureText: obscureText,
          prefixIcon: Icon(Icons.password_outlined, color: Color(0xFF002E53)),
          suffixIcon: IconButton(
            onPressed: toggleVisibility,
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFF002E53),
            ),
          ),
          labelText: "Password",
          hintText: "Enter your password",
        ),
        10.verticalSpace,

        CustomFormTextField(
          keyboardType: TextInputType.visiblePassword,
          controller: widget.verifyPasswordController,
          obscureText: obsecureTextReapet,
          prefixIcon: Icon(Icons.password_outlined, color: Color(0xFF002E53)),
          suffixIcon: IconButton(
            onPressed: toggleVisibilityReapeat,
            icon: Icon(
              obsecureTextReapet ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFF002E53),
            ),
          ),
          labelText: "Verify Password",
          hintText: "Repeat password",
        ),
        10.verticalSpace,

        CustomFormTextField(
          controller: widget.dateController,
          keyboardType: TextInputType.none,
          obscureText: false,
          readOnly: true,
          onTap: () async {
            final DateTime? dateTime = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2050),
            );

            if (dateTime != null) {
              setState(() {
                selectedDate = dateTime;
                widget.dateController.text =
                    "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
              });
            }
          },
          prefixIcon: Icon(Icons.date_range_outlined, color: Color(0xFF002E53)),
          hintText: "Choose your birth date",
        ),
        10.verticalSpace,

        CustomFormTextField(
          keyboardType: TextInputType.none,
          controller: widget.genderController,
          obscureText: false,
          readOnly: true,
          onTap: () {},
          prefixIcon: Icon(Icons.person, color: Color(0xFF002E53)),
          suffixIcon: PopupMenuButton<String>(
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              size: 50,
              color: Color(0xFF002E53),
            ),
            onSelected: (String value) {
              setState(() {
                widget.genderController.text = value;
              });
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(value: 'Male', child: Text('Male')),
                  PopupMenuItem(value: 'Female', child: Text('Female')),
                ],
          ),
          labelText: "Gender",
          hintText: "Select gender",
        ),
        10.verticalSpace,
        CustomFormTextField(
          controller: widget.nationalityController,
          keyboardType: TextInputType.none,
          readOnly: true,
          obscureText: false,
          labelText: "Nationality",
          hintText: "Select your nationality",
          prefixIcon: Icon(Icons.flag_outlined, color: Color(0xFF002E53)),
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                widget.nationalityController.text = country.name;
              },
              countryListTheme: CountryListThemeData(
                backgroundColor: Colors.grey[200]!,
                bottomSheetHeight: 500,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            );
          },
          suffixIcon: Icon(
            Icons.arrow_drop_down_rounded,
            size: 50,
            color: Color(0xFF002E53),
          ),
        ),
        15.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IntlPhoneField(
            controller: widget.phoneNumberController,
            initialCountryCode: 'SY',
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(25),
              filled: false,
              fillColor: const Color(0xFFD9D9D9),
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              hintStyle: TextStyle(color: Colors.black, fontSize: 13),
              prefixIcon: Icon(
                Icons.phone_android_outlined,
                color: Color(0xFF002E53),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.black, width: 1.3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.black, width: 1.3),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (phone) {
              widget.phoneNumberController.text = phone.completeNumber;
            },
            validator: (value) {
              if (value == null || value.number.isEmpty) {
                return 'Phone number is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
