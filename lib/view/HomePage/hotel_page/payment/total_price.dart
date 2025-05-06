import 'package:flutter/material.dart';

import 'package:test/core/utils/app_style.dart';

class TotalPrice extends StatelessWidget {
  final String title;
  final String price;
  const TotalPrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title.toString(), style: Styles.style25),
        Spacer(),
        Text(price.toString(), style: Styles.style25),
      ],
    );
  }
}
