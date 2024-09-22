import 'package:flutter/material.dart';
import 'package:gerald/core/global_components/admin_bottom_nav.dart';
import 'package:gerald/core/global_components/base_bottom_nav.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/helpers/bottom_nav_controller.dart';
import 'package:gerald/pages/main/widgets/get_adminbody.dart';
import 'package:gerald/pages/main/widgets/get_body.dart';
import 'package:get/get.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    final int initialIndex = Get.arguments?['index'] ?? 0;
    final String role = Get.arguments?['role'] ?? '';

    navController.changeTabIndex(initialIndex);

    return BaseWidgetContainer(
      body: SafeArea(
        child: Obx(() {
          if (role == 'admin') {
            return getAdminBody(navController);
          } else {
            return getBody(navController, role);
          }
        }),
      ),
      bottomNavigationBar: role == 'admin' ? AdminBottomNav() : BottomNav(),
    );
  }
}
