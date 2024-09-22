import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/profile/controller/profile_controller.dart';
import 'package:gerald/pages/profile/widgets/menu_list.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: ProfileScreenText.profile,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final userData = profileController.userData;
          return Padding(
            padding: EdgeInsets.all(24.0.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: Image.network(
                      'https://ui-avatars.com/api/?name=${userData['username'] ?? 'Default User'}',
                      fit: BoxFit.cover,
                      width: 80.r,
                      height: 80.r,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                GlobalText(
                  text: userData['username'] ?? 'Nama tidak tersedia',
                  type: TextType.bold,
                  fontSize: 22.sp,
                  textAlign: TextAlign.center,
                ),
                // GlobalText(
                //   text: userData['username'] ?? 'Username tidak tersedia',
                //   type: TextType.desc,
                //   fontSize: 16.sp,
                //   color: Colors.grey,
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 30.h),
                ProfileMenuItem(
                  text: ProfileScreenText.accountSetting,
                  onTap: () {
                    Get.offAllNamed(NavigationRoute.detailprofile);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
                  child: Divider(height: 1.h),
                ),
                ProfileMenuItem(
                  text: ProfileScreenText.aboutGerald,
                  onTap: () {
                    Get.offAllNamed(NavigationRoute.aboutGerald);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
                  child: Divider(height: 1.h),
                ),
                ProfileMenuItem(
                  text: ProfileScreenText.termsAndConditions,
                  onTap: () {
                    Get.offAllNamed(NavigationRoute.tncpp, arguments: {
                      'title': ProfileScreenText.tncTittle,
                      'text': ProfileScreenText.tncText
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
                  child: Divider(height: 1.h),
                ),
                ProfileMenuItem(
                  text: ProfileScreenText.privacyPolicy,
                  onTap: () {
                    Get.offAllNamed(NavigationRoute.tncpp, arguments: {
                      'title': ProfileScreenText.privacyTitle,
                      'text': ProfileScreenText.privacyText
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
                  child: Divider(height: 1.h),
                ),
                ProfileMenuItem(
                  text: ProfileScreenText.signOut,
                  onTap: () {
                    profileController.logout();
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
