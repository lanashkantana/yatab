import 'package:flutter/material.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_model.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_view.dart';


class HotelListViewItem extends StatelessWidget {
  final HotelListData hotelData;
  final Animation<double> animation;
  final AnimationController controller;

  const HotelListViewItem({
    super.key,
    required this.hotelData,
    required this.animation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return HotelListView(
      callback: () {},
      hotelData: hotelData,
      animation: animation,
      animationController: controller, province: '',
    );
  }
}
