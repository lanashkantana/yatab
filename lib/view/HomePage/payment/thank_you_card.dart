import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test/core/utils/app_style.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/view/HomePage/payment/card_item_info.dart';
import 'package:test/view/HomePage/payment/custom_bardcode_widget.dart';
import 'package:test/view/HomePage/payment/payment_item_info.dart';
import 'package:test/view/HomePage/payment/total_price.dart';

class ThankYouCard extends StatelessWidget {
  final String cardHolderName;
  const ThankYouCard({super.key, required this.cardHolderName});

  @override
  Widget build(BuildContext context) {
      DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xffEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            Text("${S.of(context).Thank_You}!", style: Styles.style25),
            Text(S.of(context).successful, style: Styles.style20),
            SizedBox(height: 42),
            PaymentItemInfo(title: S.of(context).Date, value: formattedDate),
            SizedBox(height: 20),
            PaymentItemInfo(title: S.of(context).Time, value: formattedTime),
            SizedBox(height: 20),
            PaymentItemInfo(title: S.of(context).From, value: cardHolderName),
            Divider(thickness: 2, height: 70),
            TotalPrice(title: S.of(context).Total, price: r"$50.97"),
            SizedBox(height: 20),
            CardItemInfo(),
            Spacer(),

            CustomBarcodeWidget(),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * 0.2 + 20) / 2 - 29,
            ),
          ],
        ),
      ),
    );
  }
}
