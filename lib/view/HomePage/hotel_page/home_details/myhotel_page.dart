import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_appbar.dart';
import 'package:test/core/widget/custom_button.dart';

class MyHotelPage extends StatelessWidget {
  final String imageUrl;
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
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: Text("Grand Royal Hotel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            25.verticalSpace,

         ClipRRect(
             borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
             bottomRight: Radius.circular(30),
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30),
             
             ),
          
         child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 300.h,
              fit: BoxFit.fill,
            ),),

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
                    return Icon(
                     Icons.star,
                      color: Colors.green,
                    );
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
                style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
              ),
              
            ),
              10.verticalSpace,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(description,style: TextStyle(fontSize: 16.sp,color: Colors.grey[600]),),
            ),
          36.verticalSpace,
            Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(text: "Booking Hotel", ontap: (){
                  GoRouter.of(context).push(AppRouter.kPayment);
              }),
            )
          ],
        ),
      ),
    );
  }
}
