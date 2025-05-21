import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final AutovalidateMode autovalidateMode;

  // ✅ استدعاء البيانات في الصفحة الأم
  final Function({
    required String cardNumber,
    required String expiryDate,
    required String cardHolderName,
    required String cvvCode,
  })? onCreditCardDataChanged;

  const CustomCreditCard({
    super.key,
    required this.formkey,
    required this.autovalidateMode,
    this.onCreditCardDataChanged,
  });

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  bool showBackView = false;

  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
          isHolderNameVisible: true,
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel model) {
            cardNumber = model.cardNumber;
            expiryDate = model.expiryDate;
            cardHolderName = model.cardHolderName;
            cvvCode = model.cvvCode;
            showBackView = model.isCvvFocused;

            // ✅ تمرير البيانات للصفحة الأم
            widget.onCreditCardDataChanged?.call(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
            );

            setState(() {});
          },
          formKey: widget.formkey,

 
        ),
      ],
    );
  }
}