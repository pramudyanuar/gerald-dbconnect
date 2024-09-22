import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/officer_view/explore/widgets/base_button.dart';
import 'package:get/get.dart';

class AboutGerald extends StatelessWidget {
  const AboutGerald({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {'index': 3});
          },
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlobalText(
                text: 'Gerald',
                fontSize: 18,
                type: TextType.bold,
              ),
              const GlobalText(
                text: 'Versi 1.0.0',
                fontSize: 14,
                type: TextType.normal,
              ),
              Image.asset(Images.logo),
              const GlobalText(
                text: '2024 chemisTRY Gemastik Team',
                fontSize: 14,
                type: TextType.normal,
              ),
              SizedBox(height: 12.h),
              const BaseButton(
                text: 'Lisensi'
              ),
            ],
          ),
        ),
      ),
    );
  }
}