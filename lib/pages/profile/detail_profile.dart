import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/profile/controller/profile_controller.dart';
import 'package:gerald/pages/profile/widgets/profile_info.dart';
import 'package:get/get.dart';

class DetailProfileScreen extends StatelessWidget {
  DetailProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: DetailProfileText.account,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        centerTitle: true,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {'index': 3, 'role': profileController.userData['role']});
          },
        ),
        action: [
          TextButton(
            onPressed: () {
              Get.offAllNamed(NavigationRoute.editprofile);
            },
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (profileController.isLoading.value) {
          // Show loading indicator while data is being loaded
          return Center(child: CircularProgressIndicator());
        } else {
          final userData = profileController.userData;
          return Padding(
            padding: EdgeInsets.all(25.0.w),
            child: Column(
              children: [
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
                SizedBox(height: 10.h),
                GlobalText(
                  text: userData['nama'] ?? 'Nama tidak tersedia',
                  fontSize: 20.sp,
                  type: TextType.bold,
                ),
                GlobalText(
                  text: '@${userData['username'] ?? 'Username tidak tersedia'}',
                  fontSize: 16.sp,
                ),
                SizedBox(height: 20.h),
                ProfileInfoRow(
                  title: 'Rumah Pompa',
                  value: userData['rumahpompa'] ?? 'Data tidak tersedia',
                ),
                ProfileInfoRow(
                  title: 'Jabatan',
                  value: userData['role'] ?? 'Data tidak tersedia',
                ),
                ProfileInfoRow(
                  title: 'Nomor HP',
                  value: userData['no_telepon'] ?? 'Data tidak tersedia',
                ),
                ProfileInfoRow(
                  title: 'Alamat',
                  value: userData['alamat'] ?? 'Data tidak tersedia',
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
