import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/generated/l10n.dart';
import 'package:test/view/HomePage/hotel_page/hotel_them.dart';

class SearchBarlist extends StatelessWidget {
  const SearchBarlist({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          /// حقل البحث
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: HotelTheme.buildLightTheme().cardColor,
                borderRadius: BorderRadius.circular(38.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child:  TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: S.of(context).Search_for_Hotel,
                ),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          /// زر البحث الدائري
          Container(
            decoration: BoxDecoration(
              color: HotelTheme.buildLightTheme().primaryColor,
              borderRadius: BorderRadius.circular(38.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 8.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(38.r),
                onTap: () {
                  // TODO: Implement search action
                },
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Icon(
                    Icons.search,
                    size: 26.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}