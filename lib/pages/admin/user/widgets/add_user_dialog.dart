import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/admin/user/controller/user_controller.dart';

class AddUserDialog extends StatelessWidget {
  final TextEditingController nameController;
  final VoidCallback onAddUser;

  const AddUserDialog({
    super.key,
    required this.nameController,
    required this.onAddUser,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalText(
              text: "Add New User",
              type: TextType.bold,
              fontSize: 20.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              placeholder: 'Name',
              controller: nameController,
            ),
            SizedBox(height: 10.h),
            Obx(() {
              return DropdownButtonFormField<String>(
                value: userController.selectedRole.value,
                items: userController.roles.map((role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    userController.selectedRole.value = value;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Role',
                  labelStyle: TextStyle(fontSize: 14.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              );
            }),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: "Cancel",
                      fontSize: 16.sp,
                      color: Colors.blue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final role = userController.selectedRole.value;
                      if (nameController.text.isNotEmpty) {
                        userController.addUser(nameController.text, role);
                      }
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: "Add",
                      fontSize: 16.sp,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
