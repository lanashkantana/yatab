import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/view/HomePage/hotel_page/home_details/home_details.dart';
import 'package:test/view/HomePage/hotel_page/hotel_them.dart';

class FilterBar extends StatelessWidget {
  final Function(String) onProvinceSelected;
  final List province=[
"Damascus",
"Aleppo",
"Homs",
"Latakia"
  ];
   FilterBar({super.key, required this.onProvinceSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HotelTheme.buildLightTheme().cardColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: null,
              hint: Text("Select Province"),
              isExpanded: true,
              underline: Container(),
              onChanged: (value) {
                if (value != null) {
                  onProvinceSelected(value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                  builder: (_) => HomeDetails(province:value),
                    ),
                  );
                }
              },
              items:  [
                DropdownMenuItem(
                  value: province[0],
                  child: Text(province[0]),
                ),
                DropdownMenuItem(
                      value: province[1],
                  child: Text(province[1]),
                ),
                DropdownMenuItem(
                   value: province[2],
                  child: Text(province[2]),
                ),
                DropdownMenuItem(
                      value: province[3],
                  child: Text(province[3]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.filter_list,
            color: HotelTheme.buildLightTheme().primaryColor,
          ),
        ],
      ),
    );
  }
}
