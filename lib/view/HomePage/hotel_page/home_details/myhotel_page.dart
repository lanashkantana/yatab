import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/core/widget/custom_button.dart';
import 'package:test/view/HomePage/payment/payment_mehods_buttom_sheet.dart';

class MyHotelPage extends StatelessWidget {
  final List<String> imageUrl;
  final String hotelName;
  final String location;
  final int pricePerNight;
  final double rating;
  final String description;

  const MyHotelPage({
    super.key,
    required this.imageUrl,
    required this.hotelName,
    required this.location,
    required this.pricePerNight,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Grand Royal Hotel",onPressed:    Navigator.of(context).pop),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            25.verticalSpace,

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
      child: Image.asset(imageUrl[0], fit: BoxFit.cover),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(imageUrl[1], fit: BoxFit.cover),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(imageUrl[2], fit: BoxFit.cover),
    ),
  ],
),

            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                hotelName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(location, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  ...List.generate(4, (index) {
                    return Icon(Icons.star, color: Colors.green);
                  }),
                  20.verticalSpace,
                  Text(
                    '($rating/5)',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "\$${pricePerNight.toStringAsFixed(2)} / Per night",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),

              child: Text(
                "Description:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ),
            36.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                text: "Booking Hotel",
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

            ),
            25.verticalSpace,
          ],
        ),
      ),
    );
  }
}
