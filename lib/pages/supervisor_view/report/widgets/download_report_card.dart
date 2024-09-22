import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class ReportWidget extends StatelessWidget {
  final String month;
  final String year;
  final VoidCallback onDownload;

  const ReportWidget({
    Key? key,
    required this.month,
    required this.year,
    required this.onDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                text: month,
                type: TextType.bold,
                fontSize: 18,
              ),
              SizedBox(height: 5.h),
              GlobalText(
                text: year,
                type: TextType.desc,
                fontSize: 14,
              ),
            ],
          ),
          OutlinedButton(
            onPressed: onDownload,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const GlobalText(
              text: "Download",
              type: TextType.normal,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}