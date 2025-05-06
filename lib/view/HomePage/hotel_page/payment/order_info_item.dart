import 'package:flutter/material.dart';
import 'package:test/core/utils/app_style.dart';

class OrderInfoItem extends StatelessWidget {
  final String title;
  final String price;
  const OrderInfoItem({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title.toString(), style: Styles.style18),
        Spacer(),
        Text(price.toString(), style: Styles.style18),
      ],
    );
  }
}
