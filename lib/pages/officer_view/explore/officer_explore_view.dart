import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/explore/controller/explore_controller.dart';
import 'package:gerald/pages/officer_view/explore/widgets/base_button.dart';
import 'package:gerald/pages/officer_view/explore/widgets/forecast.dart';
import 'package:gerald/pages/officer_view/explore/widgets/info_card.dart';
import 'package:gerald/pages/officer_view/explore/widgets/water_chart.dart';
import 'package:gerald/pages/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Class untuk kondisi cuaca
class WeatherCondition {
  final int code;
  final String descriptionId;

  const WeatherCondition(this.code, this.descriptionId);

  static const Map<int, WeatherCondition> conditions = {
    0: WeatherCondition(0, 'Langit cerah'),
    1: WeatherCondition(1, 'Sebagian berawan'),
    2: WeatherCondition(2, 'Berawan'),
    3: WeatherCondition(3, 'Mendung'),
    45: WeatherCondition(45, 'Kabut'),
    61: WeatherCondition(61, 'Hujan ringan'),
    63: WeatherCondition(63, 'Hujan sedang'),
    65: WeatherCondition(65, 'Hujan lebat'),
    80: WeatherCondition(80, 'Hujan deras mendadak'),
    95: WeatherCondition(95, 'Badai petir'),
  };

  static WeatherCondition? getCondition(int code) {
    return conditions[code];
  }

  @override
  String toString() {
    return '$code: $descriptionId';
  }
}

// Fungsi untuk mendapatkan nilai POP dari prakiraan cuaca di SharedPreferences
Future<int?> getPopValue() async {
  final prefs = await SharedPreferences.getInstance();

  // Ambil jumlah prakiraan cuaca yang disimpan
  int? count = prefs.getInt('prakiraan_cuaca_count');
  if (count != null && count > 0) {
    // Ambil prakiraan cuaca pertama sebagai contoh
    String? prakiraanString = prefs.getString('prakiraan_cuaca_0');
    if (prakiraanString != null) {
      Map<String, dynamic> prakiraan = jsonDecode(prakiraanString);
      return prakiraan['pop']; // Mengembalikan nilai 'pop'
    }
  }
  return null;
}

class OfficerExploreView extends StatelessWidget {
  OfficerExploreView({super.key});

  final ProfileController profileController = Get.put(ProfileController());
  final PumpHouseController pumpHouseController = Get.put(PumpHouseController());

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: FutureBuilder<int?>(
        future: getPopValue(),
        builder: (context, snapshot) {
          // Mengambil nilai pop dari snapshot
          String popValue = snapshot.data != null ? '${snapshot.data}%' : 'N/A';

          return Obx(() {
            // Show loading spinner while data is being fetched
            if (pumpHouseController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show error message if there is any error
            if (pumpHouseController.errorMessage.isNotEmpty) {
              return Center(child: Text(pumpHouseController.errorMessage.value));
            }

            final pumpHouseData = pumpHouseController.pumpHouseDetail;

            // Show message if no data is available
            if (pumpHouseData.isEmpty) {
              return const Center(child: Text('No data available.'));
            }

            // Extract data from pumpHouseData
            final String namaRumah = pumpHouseData['nama_rumah'] ?? 'Data tidak tersedia';
            final String waterLevel = (pumpHouseData['ketinggian_sensor']?.toString() ?? 'N/A') + ' cm';
            final String threshold = (pumpHouseData['threshold']?.toString() ?? 'N/A') + ' cm';
            
            // Get pump details
            final pumpDetails = pumpHouseData['pompa'] ?? [];
            final String pumpStatus = pumpDetails.isNotEmpty 
                ? '${pumpDetails[0]['jumlah_pompa_hidup'] ?? 0} / ${pumpDetails[0]['jumlah_total_pompa'] ?? 0}'
                : 'No pump data available';

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      text: OfficerText.hiGreet + (profileController.userData['username'] ?? 'Data tidak tersedia'),
                      fontSize: 20.sp, 
                      type: TextType.bold,
                    ),
                    GlobalText(
                      text: OfficerText.greet,
                      fontSize: 16.sp,
                      type: TextType.normal,
                    ),
                    SizedBox(height: 10.h),
                    BaseButton(
                      text: namaRumah,
                      onPressed: () => {
                        Get.offAllNamed(NavigationRoute.pumphousedetail),
                      },
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoCard(
                            title: OfficerText.weather,
                            value: popValue, // Menggunakan nilai POP
                            subtitle: OfficerText.rainPot,
                            icon: Image.asset(
                              Images.rain,
                              width: 46.w,
                              height: 42.h,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          InfoCard(
                            title: OfficerText.waterlevel,
                            value: waterLevel,
                            subtitle: 'Threshold: $threshold',
                            icon: null,
                          ),
                          SizedBox(width: 8.w),
                          InfoCard(
                            title: OfficerText.pumpstatus,
                            value: pumpStatus,
                            subtitle: OfficerText.pumpstatusdesc,
                            icon: null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Water level chart (example static data)
                    const WaterLevelChart(
                      dataPoints: [
                        FlSpot(9.00, 120),
                        FlSpot(9.05, 123),
                        FlSpot(9.10, 124),
                        FlSpot(9.15, 124),
                        FlSpot(9.20, 126),
                        FlSpot(9.25, 122),
                        FlSpot(9.30, 121),
                        FlSpot(9.35, 120),
                        FlSpot(9.40, 122),
                        FlSpot(9.45, 123),
                        FlSpot(9.50, 125),
                        FlSpot(9.55, 124),
                        FlSpot(10.00, 126),
                        FlSpot(10.05, 127),
                        FlSpot(10.10, 129),
                        FlSpot(10.15, 128),
                        FlSpot(10.20, 130),
                        FlSpot(10.25, 131),
                        FlSpot(10.30, 129),
                        FlSpot(10.35, 128),
                        FlSpot(10.40, 127),
                        FlSpot(10.45, 125),
                        FlSpot(10.50, 124),
                        FlSpot(10.55, 122),
                        FlSpot(11.00, 123),
                      ],
                      bottomLabels: [
                        '9:00',
                        '9:05',
                        '9:10',
                        '9:15',
                        '9:20',
                        '9:25',
                        '9:30',
                        '9:35',
                        '9:40',
                        '9:45',
                        '9:50',
                        '9:55',
                        '10:00',
                        '10:05',
                        '10:10',
                        '10:15',
                        '10:20',
                        '10:25',
                        '10:30',
                        '10:35',
                        '10:40',
                        '10:45',
                        '10:50',
                        '10:55',
                        '11:00',
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Forecast(),
                  ],
                ),
              ),
            );
          });
        }
      ),
    );
  }
}
