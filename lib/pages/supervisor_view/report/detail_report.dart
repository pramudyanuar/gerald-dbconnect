import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailReportScreen extends StatelessWidget {
  const DetailReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: "Detail Laporan",
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.reportlist);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 398.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color(0xFFE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    Images.trash, 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: "Rumah Pompa Mulyosari",
                    type: TextType.bold,
                    fontSize: 18,
                  ),
                  Icon(Icons.star_outline)
                ],
              ),
              const GlobalText(
                text: "3 Juni 2024 15:00",
                type: TextType.normal,
                fontSize: 16,
              ),
              SizedBox(height: 15.h),
              const GlobalText(
                text: "Mohon bantuan dari Dinas Kebersihan Kota untuk segera mengirimkan tim pembersihan guna membersihkan saluran air yang tersumbat di rumah pompa. Semoga dapat ditangani secepatnya untuk mencegah dampak yang lebih buruk bagi lingkungan dan kenyamanan warga sekitar.",
                type: TextType.desc,
                fontSize: 12,
              ),
              SizedBox(height: 15.h),
              GlobalButton(text: "Tandai Sudah Ditangani", onPressed: (){})
            ],
          ),
        ),
      )
    );
  }
}