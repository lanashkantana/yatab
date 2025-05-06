import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/core/widget/custom_credit_card.dart';
import 'package:test/view/HomePage/hotel_page/payment/thank_you_view.dart';


class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: buildAppBar(
          title: 'payment',
          onPressed: (){
        GoRouter.of(context).pop();
      }),
          
          ),
        // SliverToBoxAdapter(child: PaymentMethosListView()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formkey: formkey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: CustomButton(
                text: "Payment",
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThankYouView()));
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
