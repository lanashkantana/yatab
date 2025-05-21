import 'package:flutter/material.dart';
import 'package:test/view/HomePage/payment/payment_mothod_item.dart';



class PaymentMethosListView extends StatefulWidget {
  const PaymentMethosListView({super.key});

  @override
  State<PaymentMethosListView> createState() => _PaymentMethosListViewState();
}

class _PaymentMethosListViewState extends State<PaymentMethosListView> {
   int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    List<String> paymentMethos = [
      "assets/images/card.jpg",
      "assets/images/paypal2.png",
    ];
   
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethos.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              activeIndex = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: PaymentMethoditem(
                isActive: activeIndex == index,
                title: paymentMethos[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
