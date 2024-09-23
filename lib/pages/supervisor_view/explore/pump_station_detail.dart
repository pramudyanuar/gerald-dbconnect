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

    // Fetch pump house detail data
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

          // Check if pumpHouse is not null and has the required data
          if (pumpHouse.isEmpty) {
            return Center(child: Text('No data available'));
          }

          // Use default values or safe access for nested data
          final String namaRumah = pumpHouse['nama_rumah'] ?? SupervisorText.unknownPumpHouse;
          final String alamat = pumpHouse['alamat'] ?? SupervisorText.unknownAddress;

          // Safe access to the first pump details
          final pumpList = pumpHouse['pompa'] as List<dynamic>? ?? [];
          final firstPump = pumpList.isNotEmpty ? pumpList.first : {};
          final String pumpStatus = 
              '${firstPump['jumlah_pompa_hidup']?.toString() ?? '0'} / ${firstPump['jumlah_total_pompa']?.toString() ?? '0'}';

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
                    text: namaRumah,
                    type: TextType.bold,
                    fontSize: 20.0.sp,
                  ),
                  SizedBox(height: 4.0.h),
                  GlobalText(
                    text: alamat,
                    type: TextType.normal,
                    fontSize: 14.0.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.0.h),
                  DetailInfoCard(
                    weather: 'N/A', // Update these fields with actual data if available
                    waterLevel: pumpHouse['ketinggian_sensor']?.toString() ?? SupervisorText.unknownWaterLevel,
                    rainProbability: SupervisorText.unknownRainProbability,
                    pumpStatus: pumpStatus,
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
