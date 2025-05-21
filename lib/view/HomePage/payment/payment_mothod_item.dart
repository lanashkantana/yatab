import 'package:flutter/material.dart';

class PaymentMethoditem extends StatefulWidget {
  final bool isActive;
  final String title;
  const PaymentMethoditem({super.key, required this.isActive, required this.title});

  @override
  State<PaymentMethoditem> createState() => _PaymentMethoditemState();
}

class _PaymentMethoditemState extends State<PaymentMethoditem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.isActive ? Color(0xff34A853) : Colors.grey,

            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: widget.isActive ? Color(0xff34A853) : Colors.white,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(widget.title),
      ),
    );
  }
}
