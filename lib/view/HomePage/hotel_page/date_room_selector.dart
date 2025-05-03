import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateRoomSelector extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const DateRoomSelector({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Date",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "${DateFormat('dd, MMM').format(startDate)} - ${DateFormat('dd, MMM').format(endDate)}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 42.h,
            color: Colors.grey.withOpacity(0.8),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of Rooms',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '1 Room - 2 Adults',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
