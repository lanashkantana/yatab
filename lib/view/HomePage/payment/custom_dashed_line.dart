
import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        20,
        (index) => 
         Expanded(child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 1),
           child: Container(color: Color(0xffB8B8B8),height:3),
         )),
        
      ),
    );
  }
}