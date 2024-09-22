import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/report/controller/officer_report_controller.dart';
import 'package:gerald/pages/officer_view/report/widgets/tab_content.dart';
import 'package:gerald/pages/officer_view/report/widgets/tab_item.dart';
import 'package:get/get.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';

class OfficerReportView extends StatelessWidget {
  final OfficerReportController controller = Get.put(OfficerReportController());

  OfficerReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: OfficerText.report,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        action: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
        child: Column(
          children: [
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabItemWidget(index: 0, title: OfficerText.newtask, controller: controller),
                  TabItemWidget(index: 1, title: OfficerText.process, controller: controller),
                  TabItemWidget(index: 2, title: OfficerText.done, controller: controller),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => TabContentWidget(index: controller.selectedIndex.value, tasks: controller.tasks[controller.selectedIndex.value])),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(NavigationRoute.makereport);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
