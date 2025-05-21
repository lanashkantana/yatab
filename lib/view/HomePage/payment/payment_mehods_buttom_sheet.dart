import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/view/HomePage/payment/payment_method_list_view.dart';


class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethosListView(),
          SizedBox(height: 32),
          CustomButton(
          
            ontap: () {
              GoRouter.of(context).push(AppRouter.kPayment);
            },
              text: S.of(context).continuee,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
