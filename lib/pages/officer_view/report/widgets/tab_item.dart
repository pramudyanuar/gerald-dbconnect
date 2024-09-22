import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/pages/officer_view/report/controller/officer_report_controller.dart';
import 'package:get/get.dart';
import 'package:gerald/core/global_components/global_text.dart';

class TabItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final OfficerReportController controller;

  const TabItemWidget({
    super.key,
    required this.index,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return GestureDetector(
        onTap: () => controller.updateTabIndex(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GlobalText(
            text: title,
            type: isSelected ? TextType.bold : TextType.normal,
            color: isSelected ? Colors.black : Colors.grey,
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }
}
