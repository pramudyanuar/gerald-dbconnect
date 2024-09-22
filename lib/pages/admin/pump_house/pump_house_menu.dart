import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/admin/pump_house/controller/pump_house_controller.dart';
import 'package:gerald/pages/admin/pump_house/widgets/add_pump_house_dialog.dart';
import 'package:get/get.dart';

class ManagePumpHouseScreen extends StatelessWidget {
  final PumpHouseController pumpHouseController = Get.put(PumpHouseController());
  final TextEditingController searchController = TextEditingController();

  ManagePumpHouseScreen({super.key});

  void _showAddPumpHouseDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AddPumpHouseDialog(
          nameController: nameController,
          onAddPumpHouse: () {
            if (nameController.text.isNotEmpty) {
              pumpHouseController.addPumpHouse(nameController.text);
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
          text: AdminText.pumphouse,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    placeholder: AdminText.search + AdminText.pumphouse,
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
                      pumpHouseController.searchPumpHouse(value);
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _showAddPumpHouseDialog(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: pumpHouseController.searchResults.length,
                itemBuilder: (context, index) {
                  final pumpHouse = pumpHouseController.searchResults[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.home, color: Colors.white),
                    ),
                    title: Text(pumpHouse['title']!),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed(
                        NavigationRoute.adminpumphouse,
                        arguments: {'pumpHouse': pumpHouse},
                      );
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
