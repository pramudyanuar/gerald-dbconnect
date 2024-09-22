import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';

class TncAndPp extends StatelessWidget {
  const TncAndPp({super.key});

  @override
  Widget build(BuildContext context) {
    final String textToDisplay = Get.arguments['text'] ?? 'Default Text';
    final String tittleToDisplay = Get.arguments['title'] ?? 'Default Tittle';

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: tittleToDisplay,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {'index': 3});
          },
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.w.h),
          child: Column(
            children: [
              Image.asset(
                Images.logo,
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(height: 20.h),
              GlobalText(
                text: textToDisplay,
                fontSize: 12,
                type: TextType.desc,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      )
    );
  }
}
