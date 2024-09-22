import 'package:flutter/material.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/pages/officer_view/notification/controller/notification_controller.dart';
import 'package:get/get.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfficerNotificationView extends StatelessWidget {
  OfficerNotificationView({super.key});

  final NotificationController notificationController = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: OfficerText.notification,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomContainer(
            //       text: 'Sort',
            //       leadingIcon: Icons.swap_vert,
            //       trailingIcon: Icons.arrow_drop_down_sharp,
            //     ),
            //     CustomContainer(
            //       text: 'Filter',
            //       leadingIcon: Icons.filter_list,
            //       trailingIcon: Icons.arrow_drop_down_sharp,
            //     ),
            //   ],
            // ),
            // SizedBox(height: 16.0.h),
            Expanded(
              child: ListView.builder(
                  itemCount: notificationController.notifications.length,
                  itemBuilder: (context, index) {
                    return notificationController.notifications[index];
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}