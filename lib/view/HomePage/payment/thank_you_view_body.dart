import 'package:flutter/material.dart';
import 'package:test/view/HomePage/payment/custom_check_icon.dart';
import 'package:test/view/HomePage/payment/custom_dashed_line.dart';
import 'package:test/view/HomePage/payment/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  const ThankYouViewBody({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    // الحصول على التاريخ والوقت الحالي
  

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(cardHolderName:cardHolderName),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
            left: 28,
            right: 28,
            child: CustomDashedLine(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: -50,
            child: CustomCheckIcon(),
          ),
          
        ],
      ),
    );
  }
}