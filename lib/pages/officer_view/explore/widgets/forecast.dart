import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/officer_view/explore/controller/forecast_controller.dart';
import 'package:gerald/pages/officer_view/explore/widgets/hourly_forecast.dart';
import 'package:gerald/pages/officer_view/explore/widgets/weekly_forecast.dart';
import 'package:get/get.dart';

class Forecast extends StatelessWidget {
  final ForecastController tabController = Get.put(ForecastController());

  Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),   
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      tabController.isHourlySelected.value = true;
                    },
                    child: Column(
                      children: [
                        Obx(() => GlobalText(
                              text: "Cuaca Harian",
                              fontSize: 16.sp,
                              type: tabController.isHourlySelected.value
                                  ? TextType.bold
                                  : TextType.normal,
                              color: tabController.isHourlySelected.value
                                  ? Colors.black
                                  : Colors.black54,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      tabController.isHourlySelected.value = false;
                    },
                    child: Column(
                      children: [
                        Obx(() => GlobalText(
                              text: "Cuaca Mingguan",
                              fontSize: 16.sp,
                              type: !tabController.isHourlySelected.value
                                  ? TextType.bold
                                  : TextType.normal,
                              color: !tabController.isHourlySelected.value
                                  ? Colors.black
                                  : Colors.black54,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Obx(() => tabController.isHourlySelected.value
              ? HourlyForecast()
              : WeeklyForecast()),
        ],
      ),
    );
  }
}