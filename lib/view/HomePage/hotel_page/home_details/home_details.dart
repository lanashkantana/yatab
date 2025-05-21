import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/view/HomePage/hotel_page/home_details/myhotel_page.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_model.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_view_item.dart';


class HomeDetails extends StatefulWidget {
 final String province;
   const HomeDetails({super.key,required this.province});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> with TickerProviderStateMixin {
  List<HotelListData> hotelList = HotelListData.hotelList;
  AnimationController? animationController;
   

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int count = hotelList.length;

    return Scaffold(
      appBar: buildAppBar(title: widget.province,onPressed:  GoRouter.of(context).pop,),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: count,
              padding: const EdgeInsets.only(top: 8),
              itemBuilder: (context, index) {
                final hotel = hotelList[index];
                final animation = Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animationController!,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyHotelPage(
                          imageUrl: hotel.imagePath,
                          hotelName: hotel.titleTxt,
                          location: hotel.subTxt,
                          pricePerNight: hotel.perNight,
                          rating: hotel.rating,
                          description: hotel.description,
                        ),
                      ),
                    );
                  },
                  child: HotelListViewItem(
                    hotelData: hotel,
                    animation: animation,
                    controller: animationController!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
