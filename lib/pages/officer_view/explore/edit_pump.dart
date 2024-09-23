import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/custom_dialog.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/explore/controller/edit_pump_controller.dart';
import 'package:get/get.dart';

class EditPumpScreen extends StatelessWidget {
  EditPumpScreen({super.key});
  final EditPumpController controller = Get.put(EditPumpController());

  @override
  Widget build(BuildContext context) {
    // Initialize pump data when the screen is loaded
    controller.initializePumpData();

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.pumphousedetail);
          },
        ),
        title: GlobalText(
          text: OfficerText.pumphouse,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        backgroundColor: Colors.white,
        action: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.blue),
            onPressed: () {
              Get.dialog(CustomDialog(
                title: OfficerText.saveconfirm,
                message: OfficerText.savedesc,
                leftButtonText: OfficerText.edit,
                rightButtonText: OfficerText.savedata,
                leftButtonColor: Colors.white,
                rightButtonColor: Colors.blue,
                leftButtonTextColor: Colors.blue,
                rightButtonTextColor: Colors.white,
                onLeftButtonPressed: () {
                  Get.back(); // Close the dialog
                },
                onRightButtonPressed: () {
                  Get.back(); // Close the dialog
                  // Save the data using controller
                  controller.savePumpData(1); // Pass the pump house ID here
                },
              ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  Images.pumphouse,
                  height: 343.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),
              // Accessing 'pumpName' value safely
              Obx(() => GlobalText(
                text: controller.pumpName.value,
                type: TextType.bold,
                fontSize: 20.sp,
              )),
              SizedBox(height: 8.h),
              // Accessing 'pumpAddress' value safely
              Obx(() => GlobalText(
                text: controller.pumpAddress.value,
                type: TextType.normal,
                fontSize: 14.sp,
                color: Colors.grey,
              )),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: OfficerText.tresshold,
                        type: TextType.normal,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: controller.decrementWaterLevel,
                          ),
                          // Accessing 'waterLevel' value safely
                          Obx(() => GlobalText(
                            text: '${controller.waterLevel.value} cm', // No need for null safety as it is always an RxInt
                            type: TextType.bold,
                            fontSize: 20.sp,
                          )),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: controller.incrementWaterLevel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: OfficerText.sensorHeight,
                        type: TextType.normal,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: controller.decrementSensorHeight,
                          ),
                          // Accessing 'sensorHeight' value safely
                          Obx(() => GlobalText(
                            text: '${controller.sensorHeight.value} cm',
                            type: TextType.bold,
                            fontSize: 20.sp,
                          )),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: controller.incrementSensorHeight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: OfficerText.pumpActive,
                        type: TextType.normal,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: controller.decrementPump,
                          ),
                          // Accessing 'pumpActive' and 'maxPump' values safely
                          Obx(() => GlobalText(
                            text: '${controller.pumpActive.value} / ${controller.maxPump}',
                            type: TextType.bold,
                            fontSize: 20.sp,
                          )),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: controller.incrementPump,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
