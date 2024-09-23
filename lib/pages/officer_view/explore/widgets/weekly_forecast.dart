import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/global_text.dart';

class WeeklyForecast extends StatelessWidget {
  final List<Map<String, String>> dailyData = [
    {"day": "Sen", "temp": "19°", "status": "rainy"},
    {"day": "Sel", "temp": "20°", "status": "cloudy"},
    {"day": "Rab", "temp": "18°", "status": "sunny"},
    {"day": "Kam", "temp": "21°", "status": "rainy"},
    {"day": "Jum", "temp": "22°", "status": "cloudy"},
    {"day": "Sab", "temp": "20°", "status": "sunny"},
    {"day": "Min", "temp": "19°", "status": "rainy"},
  ];

  WeeklyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dailyData.length,
        itemBuilder: (context, index) {
          final item = dailyData[index];
          bool isToday = item["day"] == "Sel";

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: isToday ? Colors.blue :  const Color.fromARGB(51, 45, 110, 255),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: item["day"]!,
                        fontSize: 15,
                        type: TextType.bold,
                        color: isToday ? Colors.white : Colors.black,
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
                        color: isToday ? Colors.white : Colors.black,
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
