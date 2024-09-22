import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Widget? icon; // Optional icon or widget

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE0E0E0)), // Grey border
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            text: title,
            type: TextType.bold,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: 8.w),
              GlobalText(
                text: value,
                type: TextType.bold,
                fontSize: 30.sp,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          GlobalText(
            text: subtitle,
            type: TextType.desc,
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
