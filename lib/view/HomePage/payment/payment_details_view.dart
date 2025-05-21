import 'package:flutter/material.dart';

import 'package:test/view/HomePage/payment/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentDetailsViewBody(),
    );
  }
}