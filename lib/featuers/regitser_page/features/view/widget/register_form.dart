import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:test/core/widget/custom_text_field.dart';

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
    return Column(
      children: [
        CustomFormTextField(
          keyboardType: TextInputType.text,
          controller: widget.firstNameController,
          obscureText: false,
          prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xFF002E53)),
          labelText: "First Name",
          hintText: "Enter your first name",
        ),
        SizedBox(height: 10),
        
        CustomFormTextField(
          keyboardType: TextInputType.text,
          controller: widget.lastNameController,
          obscureText: false,
          prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xFF002E53)),
          labelText: "Last Name",
          hintText: "Enter your last name",
        ),
        SizedBox(height: 10),

        CustomFormTextField(
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          obscureText: false,
          prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF002E53)),
          labelText: "Email",
          hintText: "Enter your email",
        ),
        SizedBox(height: 10),

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
        SizedBox(height: 10),

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
        SizedBox(height: 10),

        CustomFormTextField(
          keyboardType: TextInputType.number,
          controller: widget.phoneNumberController,
          obscureText: false,
          prefixIcon: Icon(Icons.phone_android_outlined, color: Color(0xFF002E53)),
          labelText: "Phone Number",
          hintText: "Enter your phone number",
        ),
        SizedBox(height: 10),

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
        SizedBox(height: 10),

        CustomFormTextField(
          keyboardType: TextInputType.none,
          controller: widget.genderController,
          obscureText: false,
          readOnly: true,
          onTap: () {},
          prefixIcon: Icon(Icons.person, color: Color(0xFF002E53)),
          suffixIcon: PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down_rounded, size: 50, color: Color(0xFF002E53)),
            onSelected: (String value) {
              setState(() {
                widget.genderController.text = value;
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: 'Male', child: Text('Male')),
              PopupMenuItem(value: 'Female', child: Text('Female')),
            ],
          ),
          labelText: "Gender",
          hintText: "Select gender",
        ),
        SizedBox(height: 10),

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
          suffixIcon: Icon(Icons.arrow_drop_down_rounded, size: 50, color: Color(0xFF002E53)),
        ),
      ],
    );
  }
}