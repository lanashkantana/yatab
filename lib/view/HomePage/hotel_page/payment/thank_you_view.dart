import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/view/HomePage/hotel_page/payment/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onPressed: (){
        GoRouter.of(context).pop();
      }),
      body: Transform.translate(
        offset: Offset(0, -20),

        child: ThankYouViewBody(),
      ),
    );
  }
}
