import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  text: title,
                  type: TextType.bold,
                  fontSize: 12.sp,
                ),
                SizedBox(height: 4.h),
                GlobalText(
                  text: description,
                  type: TextType.desc,
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          GlobalText(
            text: date,
            type: TextType.desc,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
