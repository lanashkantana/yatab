import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/view/HomePage/payment/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  const ThankYouView({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onPressed: () => GoRouter.of(context).pop(),
      ),
      body: Transform.translate(
        offset: const Offset(0, -20),
        child: ThankYouViewBody(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
        ),
      ),
    );
  }
}
