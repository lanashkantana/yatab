import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class CustomCreditCard extends StatefulWidget {
    final GlobalKey<FormState> formkey ;
   final  AutovalidateMode autovalidateMode;

   const CustomCreditCard({super.key,required this.formkey,required  this.autovalidateMode});

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
          showBackView:
              showBackView, //true when you want to show cvv(back) view
          onCreditCardWidgetChange:
              (value) {}, // Callback for anytime credit card brand is changed
          isHolderNameVisible: true,
        
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel ) {
            cardNumber = CreditCardModel.cardNumber;
            expiryDate = CreditCardModel.expiryDate;
            cardHolderName = CreditCardModel.cardHolderName;
            cvvCode = CreditCardModel.cvvCode;
            showBackView = CreditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formkey,
        ),
       
      ],
    );
  }
}
