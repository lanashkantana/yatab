import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_credit_card.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/view/HomePage/payment/thank_you_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // ✅ البيانات التي سيتم إرسالها
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: buildAppBar(
            title: S.of(context).Payment,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formkey: formkey,
            autovalidateMode: autovalidateMode,
            onCreditCardDataChanged: ({
              required String cardNumber,
              required String expiryDate,
              required String cardHolderName,
              required String cvvCode,
            }) {
              // ✅ حفظ البيانات
              this.cardNumber = cardNumber;
              this.expiryDate = expiryDate;
              this.cardHolderName = cardHolderName;
              this.cvvCode = cvvCode;
            },
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: S.of(context).pay,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ThankYouView(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                        ),
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
