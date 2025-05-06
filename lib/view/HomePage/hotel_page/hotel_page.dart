import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/widget/custom_app_bar.dart';

import 'package:test/view/HomePage/hotel_page/contest_tab_header.dart';
import 'package:test/view/HomePage/hotel_page/date_room_selector.dart';
import 'package:test/view/HomePage/hotel_page/filter_bar.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_model.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_view_item.dart';
import 'package:test/view/HomePage/hotel_page/search_bar.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({super.key});

  @override
  State<HotelHomeScreen> createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
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
      appBar: buildAppBar(
        title: "Hotel Page",
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kBottomNavBar);
        },
      ),

      body: Column(
        children: [
          Expanded(
            // flex: 100,
            child: NestedScrollView(
              headerSliverBuilder:
                  (_, __) => [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        const SearchBarlist(),
                        DateRoomSelector(
                          startDate: startDate,
                          endDate: endDate,
                        ),
                      ]),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: ContestTabHeader(
                        FilterBar(
                          onProvinceSelected: (String province) {
                            setState(() {
                              //  GoRoute.of(context).
                            });
                          },
                        ),
                      ),
                    ),
                  ],
              body: ListView.builder(
                itemCount: count,
                padding: const EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  final animation = Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval(
                        (1 / count) * index,
                        1.0,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  );
                  return HotelListViewItem(
                    hotelData: hotelList[index],
                    animation: animation,
                    controller: animationController!,
                  );
                },
              ),
            ),
          ),
          // 100.verticalSpace,
          60.verticalSpace,
        ],
      ),
    );
  }
}
