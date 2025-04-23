
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final VoidCallback onTap;

  const ProfileListItem({
    super.key,
    required this.hasNavigation,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(icon, size: 20.sp),
                onPressed: () {},
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 15.w),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
              const Spacer(),
              if (hasNavigation)
                IconButton(
                  icon: Icon(LineAwesomeIcons.angle_right_solid, size: 22.sp),
                  onPressed: () {},
                  color: Theme.of(context).iconTheme.color,
                ),
            ],
          ),
        ),
      ),
    );
  }
  }