import 'package:flutter/material.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/auth/controller/resetpass_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotpassScreen extends StatelessWidget {
  final forgotpassController = Get.put(ResetpassController());
  ForgotpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: AppBar(
        title: GlobalText(
          text: 'Forgot Password',
          fontSize: 20.sp, // Adjust font size with sp
          type: TextType.bold,
        ),
        centerTitle: true,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.login);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Use w for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h), // Use h for height
            GlobalText(
              text: 'Enter your email to reset your password',
              fontSize: 18.sp, // Adjust font size with sp
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              label: 'Email',
              placeholder: 'email',
              controller: forgotpassController.emailController,
            ),
            SizedBox(height: 20.h),
            GlobalButton(
              text: 'Reset Password',
              onPressed: () {
                forgotpassController.resetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}