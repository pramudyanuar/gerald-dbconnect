import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_button.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/auth/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 0.4.sh, // Adjusted to use ScreenUtil height
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    Images.login,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.white.withOpacity(0.7), // 70% opacity
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h), // Use ScreenUtil for height
                  GlobalText(
                    text: LoginScreenText.welcome,
                    type: TextType.bold,
                    fontSize: 24.sp, // Adjust font size with sp
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: loginController.emailController,
                    placeholder: LoginScreenText.useremail,
                  ),
                  Obx(() => CustomTextField(
                    obscureText: loginController.isHidden.value,
                    controller: loginController.passwordController,
                    placeholder: LoginScreenText.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        loginController.showPassword();
                      },
                    ),
                  )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.offAllNamed(NavigationRoute.forgotpass);
                      },
                      child: Text(
                        LoginScreenText.forgotPassword,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GlobalButton(
                    onPressed: () {
                      loginController.login();
                    },
                    text: LoginScreenText.login,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
