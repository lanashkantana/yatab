import 'package:flutter/material.dart';
import 'package:test/view/HomePage/person_page/profile_screen.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: ProfileScreen(),
    );
  }
}