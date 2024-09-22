import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/global_text.dart';

class HourlyForecast extends StatelessWidget {
  final List<Map<String, String>> hourlyData = [
    {"time": "6:00", "temp": "19°", "status": "rainy"},
    {"time": "Sekarang", "temp": "19°", "status": "rainy"},
    {"time": "8:00", "temp": "18°", "status": "rainy"},
    {"time": "9:00", "temp": "19°", "status": "rainy"},
    {"time": "10:00", "temp": "20°", "status": "rainy"},
    // Add more data as needed
  ];
  
  HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyData.length,
        itemBuilder: (context, index) {
          final item = hourlyData[index];
          bool isNow = item["time"] == "Sekarang";

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: isNow ? Colors.blue : const Color.fromARGB(51, 45, 110, 255),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: item["time"]!,
                        fontSize: item["time"] == "Sekarang" ? 12.sp : 15.sp,
                        type: TextType.bold,
                        color: isNow ? Colors.white : Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Image.asset(
                        Images.rain,
                        width: 32.w,
                        height: 32.h,
                      ),
                      SizedBox(height: 8.h),
                      GlobalText(
                        text: item["temp"]!,
                        fontSize: 20,
                        type: TextType.bold,
                        color: isNow ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}