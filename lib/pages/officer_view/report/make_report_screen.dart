import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/report/controller/officer_report_controller.dart';
import 'package:get/get.dart';

class MakeReportScreen extends StatelessWidget {
  final OfficerReportController controller = Get.put(OfficerReportController());
  MakeReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: OfficerText.makereport,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {"index": 1});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.blue.withOpacity(0.5),
                          size: 60.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GlobalButton(
                        text: OfficerText.uploadpic,
                        onPressed: () {},
                        width: 100.w,
                        height: 40.h,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GlobalText(
                        text: "Rumah Pompa Semolowaru II",
                        type: TextType.bold,
                        fontSize: 16.sp, // Adjust font size
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GlobalText(
                        text: OfficerText.category,
                        type: TextType.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    DropdownButtonFormField<String>(
                      value: "Saluran tersumbat sampah",
                      items: [
                        DropdownMenuItem(
                          value: "Saluran tersumbat sampah",
                          child: GlobalText(
                            text: "Saluran tersumbat sampah",
                            type: TextType.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                      onChanged: (value) {

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GlobalText(
                        text: OfficerText.reportdetail,
                        type: TextType.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: OfficerText.reportdetailtext,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    GlobalButton(
                      onPressed: () {
                        controller.addTask("New Task");
                      },
                      text: OfficerText.submit,
                    ),
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }
}