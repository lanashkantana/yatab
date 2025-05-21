import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/generated/l10n.dart';

class QRCodePage extends StatelessWidget {
  final String appUrl = 'https://your.app.link';

  const QRCodePage({super.key}); // Replace with your app link

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      buildAppBar(title:S.of(context).Contact_Us,onPressed: (){
              GoRouter.of(context).pop();
        }),   
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: PrettyQrView.data(
            data: appUrl,
            decoration: const PrettyQrDecoration(
              shape: PrettyQrSmoothSymbol(
                color: Colors.black,
              ),
              image: PrettyQrDecorationImage(
                image: AssetImage('assets/logo.png'), // Optional logo
              ),
            ),
          ),
        ),
      ),
    );
  }
}
