import 'package:flutter/material.dart';
import 'package:gerald/core/global_components/admin_bottom_nav.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/helpers/bottom_nav_controller.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/admin/pump_house/pump_house_menu.dart';
import 'package:gerald/pages/admin/user/user_menu.dart';
import 'package:get/get.dart';

class AdminMainMenuScreen extends StatelessWidget {
  const AdminMainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    final int initialIndex = Get.arguments?['index'] ?? 0;

    navController.changeTabIndex(initialIndex);

    return BaseWidgetContainer(
      body: SafeArea(
        child: Obx(() {
          switch (navController.selectedIndex.value) {
            case 0:
              return ManageUserScreen();
            case 1:
              return ManagePumpHouseScreen();
            case 2:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.offAllNamed(NavigationRoute.login);
              });
              return const SizedBox.shrink();
            default:
              return const SizedBox.shrink();
          }
        }),
      ),
      bottomNavigationBar: AdminBottomNav(),
    );
  }
}
