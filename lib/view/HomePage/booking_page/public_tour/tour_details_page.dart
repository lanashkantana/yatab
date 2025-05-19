import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/view/HomePage/booking_page/public_tour/class_tour.dart';
import 'package:test/view/HomePage/hotel_page/payment/payment_mehods_buttom_sheet.dart';


class TourDetailPage extends StatelessWidget {
  final Tour tour;

  const TourDetailPage({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: tour.name, onPressed: () {
        Navigator.of(context).pop();
      }),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           CarouselSlider(
  options: CarouselOptions(
    height: 350.h,
    enlargeCenterPage: true,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    aspectRatio: 16 / 9,
    viewportFraction: 0.8, // تأكد من أن هذه القيمة مناسبة لعرض 3 صور
  ),
  items: [
    // استبدل هذه الصور بالمسارات الصحيحة للصور
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(tour.imageUrl[0], fit: BoxFit.cover),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(tour.imageUrl[1], fit: BoxFit.cover),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(tour.imageUrl[2], fit: BoxFit.cover),
    ),
  ],
),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    Text(
                      '\$${tour.price}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Details:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      tour.details,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Guide Name:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tour.guideName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Available Seats:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${tour.seats}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: "Booking Tour",
                      ontap: () {
                        showModalBottomSheet(
                          backgroundColor: Color(0xffD8D8D8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          context: context,
                          builder: (context) {
                            return PaymentMethodsBottomSheet();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}