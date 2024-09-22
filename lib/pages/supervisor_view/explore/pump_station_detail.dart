import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/supervisor_view/explore/widgets/detail_info.dart';
import 'package:get/get.dart';
import 'package:gerald/pages/supervisor_view/explore/controller/pump_house_detail_controller.dart';

class PumpStationDetailScreen extends StatelessWidget {
  const PumpStationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String pumpHouseId = Get.arguments['pumpHouseId'].toString();
    final PumpHouseDetailController pumpHouseDetailController = Get.put(PumpHouseDetailController());

    pumpHouseDetailController.fetchPumpHouseDetail(pumpHouseId);

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
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {'index': 0, 'role': 'pengawas'});
          },
        ),
      ),
      body: Obx(() {
        if (pumpHouseDetailController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final pumpHouse = pumpHouseDetailController.pumpHouseDetail;

          return SingleChildScrollView(
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
                    text: pumpHouse['nama_rumah'] ?? SupervisorText.unknownPumpHouse,
                    type: TextType.bold,
                    fontSize: 20.0.sp,
                  ),
                  SizedBox(height: 4.0.h),
                  GlobalText(
                    text: pumpHouse['alamat'] ?? SupervisorText.unknownAddress,
                    type: TextType.normal,
                    fontSize: 14.0.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.0.h),
                  DetailInfoCard(
                    weather: 'N/A', // Update these fields with actual data if available
                    waterLevel: pumpHouse['ketinggian_sensor']?.toString() ?? SupervisorText.unknownWaterLevel,
                    rainProbability: SupervisorText.unknownRainProbability,
                    pumpStatus: (pumpHouse['pompa']?.first['jumlah_pompa_hidup']?.toString() ?? '0') + ' / ' + (pumpHouse['pompa']?.first['jumlah_total_pompa']?.toString() ?? '0'),
                    waterLevelLimit: pumpHouse['threshold']?.toString() ?? SupervisorText.unknownWaterLevelLimit,
                    sensorHeight: pumpHouse['ketinggian_sensor']?.toString() ?? SupervisorText.unknownWaterLevel,
                    floodPotential: SupervisorText.unknownFloodPotential,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
