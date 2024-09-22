import 'package:flutter/material.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  Images.onboarding,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.white.withOpacity(0.7),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    text: OnboardingText.title,
                    type: TextType.bold,
                    fontSize: 24.sp,
                  ),
                  SizedBox(height: 8.h),
                  GlobalText(
                    text: OnboardingText.description,
                    type: TextType.desc,
                    fontSize: 12.sp,
                  ),
                  SizedBox(height: 16.h),
                  GlobalButton(
                    text: OnboardingText.button,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('hasSeenOnboarding', true);
                      Get.offAllNamed(NavigationRoute.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
