import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/notification/controller/notification_controller.dart';
import 'package:gerald/pages/supervisor_view/notification/widgets/notification_card.dart';
import 'package:get/get.dart';

class SupervisorNotificationView extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  SupervisorNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: const GlobalText(
          text: SupervisorText.notificationTitle,
          type: TextType.bold,
          fontSize: 18,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     GestureDetector(
            //       onTap: () => controller.sortNotifications(),
            //       child: const CustomContainer(
            //         text: SupervisorText.sortText, // Gunakan string dari SupervisorText
            //         leadingIcon: Icons.swap_vert,
            //         trailingIcon: Icons.arrow_drop_down_sharp,
            //       ),
            //     ),
            //     const CustomContainer(
            //       text: SupervisorText.filterText, // Gunakan string dari SupervisorText
            //       leadingIcon: Icons.filter_list,
            //       trailingIcon: Icons.arrow_drop_down_sharp,
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    return NotificationCard(
                      title: notification.title,
                      description: notification.description,
                      date: notification.date,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
