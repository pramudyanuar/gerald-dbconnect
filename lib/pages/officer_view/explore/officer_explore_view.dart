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

class OfficerExploreView extends StatelessWidget {
  OfficerExploreView({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final userData = profileController.userData;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  text: OfficerText.hiGreet + (userData['username'] ?? 'Data tidak tersedia'),
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
                  text: userData['rumahpompa'] ?? 'Data tidak tersedia',
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
                        value: '70%',
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
                        value: '90 cm',
                        subtitle: '+10% dalam 1 jam',
                        icon: null,
                      ),
                      SizedBox(width: 8.w),
                      InfoCard(
                        title: OfficerText.pumpstatus,
                        value: '8/10',
                        subtitle: OfficerText.pumpstatusdesc,
                        icon: null,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                WaterLevelChart(
                  dataPoints: [
                    const FlSpot(0, 60),
                    const FlSpot(1, 70),
                    const FlSpot(2, 80),
                    const FlSpot(3, 85),
                    const FlSpot(4, 75),
                    const FlSpot(5, 90),
                    const FlSpot(6, 90),
                    const FlSpot(7, 99),
                  ],
                  bottomLabels: [
                    '0',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                  ],
                ),
                SizedBox(height: 10.h),
                Forecast(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
