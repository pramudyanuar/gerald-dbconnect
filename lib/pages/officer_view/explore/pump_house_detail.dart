import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/explore/controller/edit_pump_controller.dart';
import 'package:get/get.dart';

class PumpHouseScreen extends StatelessWidget {
  PumpHouseScreen({super.key});
  final EditpumpdetailController editpumpdetailController = Get.put(EditpumpdetailController());
  final pumpData = EditpumpdetailController().pumpData;

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu);
          },
        ),
        title: GlobalText(
          text: OfficerText.pumphouse,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        action: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              Get.offAllNamed(NavigationRoute.editpump);
            },
          ),
        ],
      ),
      body: Padding(
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
            GlobalText(
              text: pumpData['nama'],
              type: TextType.bold,
              fontSize: 20.sp,
            ),
            SizedBox(height: 8.h),
            GlobalText(
              text: pumpData['alamat'],
              type: TextType.normal,
              fontSize: 14.sp,
              color: Colors.grey,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                GlobalText(
                  text: pumpData['tresshold'].toString(),
                  type: TextType.bold,
                  fontSize: 20.sp,
                ),
                SizedBox(width: 8.w),
                GlobalText(
                  text: OfficerText.tresshold,
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                GlobalText(
                  text: pumpData['waterLevel'].toString(),
                  type: TextType.bold,
                  fontSize: 20.sp,
                ),
                SizedBox(width: 8.w),
                GlobalText(
                  text: OfficerText.waterlevel,
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                GlobalText(
                  text: pumpData['pumpActive'].toString() + '/' + pumpData['maxPump'].toString(),
                  type: TextType.bold,
                  fontSize: 20.sp,
                ),
                SizedBox(width: 8.w),
                GlobalText(
                  text: OfficerText.pumpstatusdesc,
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
