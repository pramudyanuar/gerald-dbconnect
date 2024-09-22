import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/admin/pump_house/widgets/detail_info.dart';
import 'package:get/get.dart';

class AdminPumpStationDetail extends StatelessWidget {
  const AdminPumpStationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> selectedPumpHouse = Get.arguments['pumpHouse'];

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: SupervisorText.pumpHouseTitle,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.adminmenu, arguments: {"index": 1});
          },
        ),
        action: [
          IconButton(
            onPressed: () {
              // Get.toNamed(NavigationRoute.editpump, arguments: {'pumpHouse': selectedPumpHouse});
            },
            icon: const Icon(Icons.edit, color: Colors.blue,),
          ),
        ],
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0.r),
                child: Image.asset(
                  Images.onboarding,
                  height: 343.0.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0.h),
              GlobalText(
                text: selectedPumpHouse['title'] ?? SupervisorText.unknownPumpHouse,
                type: TextType.bold,
                fontSize: 20.0.sp,
              ),
              SizedBox(height: 4.0.h),
              GlobalText(
                text: selectedPumpHouse['address'] ?? SupervisorText.unknownAddress,
                type: TextType.normal,
                fontSize: 14.0.sp,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0.h),
              DetailInfoCard(
                weather: selectedPumpHouse['weather'] ?? SupervisorText.unknownWeather,
                waterLevel: selectedPumpHouse['waterLevel'] ?? SupervisorText.unknownWaterLevel,
                rainProbability: selectedPumpHouse['rainProbability'] ?? SupervisorText.unknownRainProbability,
                pumpStatus: selectedPumpHouse['pumpStatus'] ?? SupervisorText.unknownPumpStatus,
                waterLevelLimit: selectedPumpHouse['waterLevelLimit'] ?? SupervisorText.unknownWaterLevelLimit,
                sensorHeight: selectedPumpHouse['sensorHeight'] ?? SupervisorText.unknownSensorHeight,
                floodPotential: selectedPumpHouse['floodPotential'] ?? SupervisorText.unknownFloodPotential,
              ),
            ],
          ),
        ),
      ),
    );
  }
}