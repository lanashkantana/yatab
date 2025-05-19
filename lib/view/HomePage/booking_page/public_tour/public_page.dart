import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_image.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/view/HomePage/booking_page/public_tour/class_tour.dart';
import 'package:test/view/HomePage/booking_page/public_tour/tour_details_page.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tour> tours = [
      Tour(
        name: 'City Tour',
        price: 50.0,
        details: 'Explore the city with a local Explore the city with a local Explore the city with a local Explore the city with a local Explore the city with a local Explore the city with a local ',
        guideName: 'John Doe',
        seats: 10,
        imageUrl: [
AssetsData.hotel1,
AssetsData.hotel2,
AssetsData.hotel3,


        ]
      ),
      Tour(
        name: 'Beach Trip',
        price: 75.0,
        details: 'Relax at the beach with all amenities asdad at the beach with all amenities Relax at the beach with all amenities Relax at the beach with all amenitiesRelax at the beach with all amenities.',
        guideName: 'Jane Smith',
        seats: 8,
        imageUrl: [

AssetsData.hotel2,
AssetsData.hotel3,
AssetsData.hotel4,
        ]
      ),
       Tour(
        name: 'Beach Trip',
        price: 75.0,
        details: 'Relax at the beach with all amenities Relax at the beach with all amenities Relax at the beach with all amenities.',
        guideName: 'Jane Smith',
        seats: 8,
        imageUrl: [
AssetsData.hotel3,
AssetsData.hotel4,
AssetsData.hotel5,
        ]
      ),
       Tour(
        name: 'Beach Trip',
        price: 75.0,
        details: 'Relax at the beach with all amenities Relax at the beach with all amenities Relax at the beach with all amenities.',
        guideName: 'Jane Smith',
        seats: 8,
        imageUrl: [
AssetsData.hotel3,
AssetsData.hotel5,
AssetsData.hotel4,
        ]
      ),
      // Add more tours here
    ];

    return Scaffold(
      appBar: buildAppBar(title: "Public Tour",onPressed: (){
      GoRouter.of(context).push(AppRouter.kBottomNavBar);
          }),
      body: ListView.builder(
        itemCount: tours.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TourDetailPage(tour: tours[index])));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(
                        tours[index].imageUrl[0],
                        width: double.infinity,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tours[index].name,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Details:",
                            style: TextStyle(fontSize: 18.sp, color: Colors.black),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            tours[index].details,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Seats: ${tours[index].seats}",
                                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                              ),
                              Text(
                                "\$${tours[index].price} Per Person",
                                style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}