import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/custom_dialog.dart';
import 'package:gerald/core/global_components/custom_dropdown.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final userData = profileController.userData;

    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        leading: CustomBackButton(
          onPressed: () {
            Get.dialog(
              CustomDialog(
                title: EditProfileText.cancelEdit,
                message: EditProfileText.editMessage,
                leftButtonText: EditProfileText.cancel,
                rightButtonText: EditProfileText.back,
                leftButtonColor: Colors.black,
                rightButtonColor: Colors.white,
                leftButtonTextColor: Colors.white,
                rightButtonTextColor: Colors.blue,
                onLeftButtonPressed: () {
                  Get.offAllNamed(NavigationRoute.detailprofile);
                },
                onRightButtonPressed: () {
                  // Handle save action
                  Get.back(); // Close the dialog
                  // Additional save logic here
                },
              ),
            );
          },
        ),
        title: GlobalText(
          text: EditProfileText.edit,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        centerTitle: true,
        action: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Get.dialog(
                CustomDialog(
                  title: EditProfileText.save,
                  message: EditProfileText.saveMessage,
                  leftButtonText: EditProfileText.edit,
                  rightButtonText: EditProfileText.saveData,
                  leftButtonColor: Colors.white,
                  rightButtonColor: Colors.blue,
                  leftButtonTextColor: Colors.blue,
                  rightButtonTextColor: Colors.white,
                  onLeftButtonPressed: () {
                    // Handle edit action
                    Get.back(); // Close the dialog
                  },
                  onRightButtonPressed: () {
                    // Handle save action
                    Get.back(); // Close the dialog
                    // Additional save logic here
                  },
                ),
              );
            },
          ),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.grey.shade200,
                child: CircleAvatar(
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
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                title: EditProfileText.name,
                placeholder: EditProfileText.name,
                initialText: userData['username'],
              ),
              CustomTextField(
                title: EditProfileText.pumphouse,
                placeholder: EditProfileText.pumphouse,
                initialText: userData['nama_pompa'],
              ),
              // const CustomDropdownField(
              //   title: EditProfileText.pumphouse,
              //   value: 'Mulyosari (Ring road ITS)',
              //   items: [
              //     'Mulyosari (Ring road ITS)',
              //     'Option 2',
              //     'Option 3',
              //   ],
              // ),
              const CustomDropdownField(
                title: 'Jabatan',
                value: 'Petugas',
                items: [
                  'Petugas',
                  'Option 2',
                  'Option 3',
                ],
              ),
              CustomTextField(
                title: EditProfileText.phoneNumber,
                placeholder: EditProfileText.phoneNumber,
                initialText: userData['no_telepon'],
              ),
              CustomTextField(
                title: EditProfileText.alamat,
                placeholder: EditProfileText.alamat,
                initialText: userData['alamat'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
