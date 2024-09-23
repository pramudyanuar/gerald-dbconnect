import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  // Fungsi untuk mengambil data prakiraan cuaca dari SharedPreferences
  Future<List<Map<String, String>>> _getHourlyData() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> hourlyData = [];

    int? count = prefs.getInt('prakiraan_cuaca_count');
    if (count != null && count > 0) {
      for (int i = 0; i < count; i++) {
        String? prakiraanString = prefs.getString('prakiraan_cuaca_$i');
        if (prakiraanString != null) {
          Map<String, dynamic> prakiraan = jsonDecode(prakiraanString);
          hourlyData.add({
            "time": _formatTime(prakiraan['waktu_prakiraan']),
            "temp": '${prakiraan['temperatur']}°C',
          });
        }
      }
    }
    return hourlyData;
  }

  // Fungsi untuk memformat waktu menjadi "Jam:Menit"
  String _formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    dateTime = dateTime.add(const Duration(hours: 6));
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: _getHourlyData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final hourlyData = snapshot.data ?? [];

        if (hourlyData.isEmpty) {
          return const Center(child: Text('No hourly data available.'));
        }
        String currentHour = DateTime.now().hour.toString().padLeft(2, '0');
        return SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyData.length,
            itemBuilder: (context, index) {
              final item = hourlyData[index];
              bool isNow = item["time"] == '09:00';
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
                            fontSize: isNow ? 12.sp : 15.sp,
                            type: TextType.bold,
                            color: isNow ? Colors.white : Colors.black,
                          ),
                          SizedBox(height: 8.h),
                          Image.asset(
                            Images.rain, // Sesuaikan dengan cuaca jika ada ikon berbeda
                            width: 32.w,
                            height: 32.h,
                          ),
                          SizedBox(height: 8.h),
                          GlobalText(
                            text: item["temp"]!,
                            fontSize: 15.sp,
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
      },
    );
  }
}
