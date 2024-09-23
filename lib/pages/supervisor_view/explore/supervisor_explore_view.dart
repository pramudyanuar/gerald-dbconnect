import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/explore/widgets/pump_house_card.dart';
import 'package:gerald/pages/supervisor_view/explore/controller/pump_house_controller.dart';
import 'package:get/get.dart';

class SupervisorExploreView extends StatelessWidget {
  const SupervisorExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final pumpHouseController = Get.put(PumpHouseController());

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: Obx(() {
          return pumpHouseController.isSearching.value
              ? TextField(
                  onChanged: (value) {
                    pumpHouseController.search(value);
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: SupervisorText.searchHintText,
                    border: InputBorder.none,
                  ),
                )
              : GlobalText(
                  text: SupervisorText.pumpHouseTitle,
                  type: TextType.bold,
                  fontSize: 18.sp,
                );
        }),
        action: [
          Obx(() {
            return pumpHouseController.isSearching.value
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.blue, size: 24.sp),
                    onPressed: () {
                      pumpHouseController.stopSearching();
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search, color: Colors.blue, size: 24.sp),
                    onPressed: () {
                      pumpHouseController.startSearching();
                    },
                  );
          }),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.all(16.0.w),
          itemCount: pumpHouseController.searchResults.length,
          itemBuilder: (context, index) { 
            final data = pumpHouseController.searchResults[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.0.h),
              child: PumpHouseCard(
                title: data['title']!,
                weather: data['weather']!,
                waterLevel: data['waterLevel']!,
                onTap: () {
                  pumpHouseController.gotoPumpDetail(data['id_rumah_pompa']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
