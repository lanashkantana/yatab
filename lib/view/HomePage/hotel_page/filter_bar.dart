import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/view/HomePage/hotel_page/home_details/home_details.dart';
import 'package:test/view/HomePage/hotel_page/hotel_them.dart';

class FilterBar extends StatelessWidget {
  final Function(String) onProvinceSelected;
  const FilterBar({super.key, required this.onProvinceSelected});

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
                  builder: (_) => HomeDetails(),
                    ),
                  );
                }
              },
              items: const [
                DropdownMenuItem(
                  value: 'all',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'damascus',
                  child: Text('Damascus'),
                ),
                DropdownMenuItem(
                  value: 'aleppo',
                  child: Text('Aleppo'),
                ),
                DropdownMenuItem(
                  value: 'homs',
                  child: Text('Homs'),
                ),
                DropdownMenuItem(
                  value: 'latakia',
                  child: Text('Latakia'),
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
