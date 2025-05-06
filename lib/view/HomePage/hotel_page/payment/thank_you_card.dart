import 'package:flutter/material.dart';
import 'package:test/core/utils/app_style.dart';
import 'package:test/view/HomePage/hotel_page/payment/card_item_info.dart';
import 'package:test/view/HomePage/hotel_page/payment/custom_bardcode_widget.dart';
import 'package:test/view/HomePage/hotel_page/payment/payment_item_info.dart';
import 'package:test/view/HomePage/hotel_page/payment/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("Thank You!", style: Styles.style25),
            Text("Your transaction was successful", style: Styles.style20),
            SizedBox(height: 42),
            PaymentItemInfo(title: "Date", value: "01/24/2023"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "Time", value: "10:15 AM"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "To", value: "Sam Louis"),
            Divider(thickness: 2, height: 70),
            TotalPrice(title: "Total", price: r"$50.97"),
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
