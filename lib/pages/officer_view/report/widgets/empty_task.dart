import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/global_text.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const EmptyStateWidget({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Icon(Icons.image, size: 40, color: Colors.blue),
          ),
          SizedBox(height: 24.h),

          const GlobalText(
            text: OfficerText.emptyreport,
            type: TextType.bold,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          const GlobalText(
            text: OfficerText.emptyreportdesc + OfficerText.emptyreportdesc2,
            type: TextType.desc,
            fontSize: 14,
            textAlign: TextAlign.center,
            color: Colors.grey,
          ),
          SizedBox(height: 32.h),

          GlobalButton(
            text: OfficerText.makereport,
            onPressed: onButtonPressed,
            width: 100.w,
            height: 40.h,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}