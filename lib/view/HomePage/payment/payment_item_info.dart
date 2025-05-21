import 'package:flutter/material.dart';
import 'package:test/core/utils/app_style.dart';


class PaymentItemInfo extends StatelessWidget {
  final String title;
  final String value;
  const PaymentItemInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.style18),
        Text(value, style: Styles.styleBold18),
      ],
    );
  }
}
