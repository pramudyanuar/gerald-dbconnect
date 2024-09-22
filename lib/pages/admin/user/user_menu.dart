import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/admin/user/controller/user_controller.dart';
import 'package:gerald/pages/admin/user/widgets/add_user_dialog.dart';
import 'package:get/get.dart';

class ManageUserScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController searchController = TextEditingController();

  ManageUserScreen({super.key});

  void _showAddUserDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController roleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AddUserDialog(
          nameController: nameController,
          onAddUser: () {
            if (nameController.text.isNotEmpty && roleController.text.isNotEmpty) {
              userController.addUser(
                nameController.text,
                roleController.text,
              );
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: GlobalText(
          text: AdminText.user,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left : 16.w, right: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    placeholder: AdminText.search + AdminText.user,
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FE),
                    ),
                    onChanged: (value) {
                      userController.searchUser(value);
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _showAddUserDialog(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: userController.searchResults.length,
                itemBuilder: (context, index) {
                  final user = userController.searchResults[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(user['name']!),
                    subtitle: Text(user['role']!),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to user details or edit screen
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
