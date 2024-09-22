import 'package:flutter/material.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:gerald/pages/admin/pump_house/pump_house_menu.dart';
import 'package:gerald/pages/admin/user/user_menu.dart';
import 'package:gerald/core/helpers/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  await prefs.clear();
  await prefs.setBool('hasSeenOnboarding', hasSeenOnboarding);
}

Widget getAdminBody(NavController navController) {
  switch (navController.selectedIndex.value) {
    case 0:
      return ManageUserScreen();
    case 1:
      return ManagePumpHouseScreen();
    case 2:
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await logoutUser();
        Get.offAllNamed(NavigationRoute.login);
      });
      return const SizedBox.shrink();
    default:
      return const SizedBox.shrink();
  }
}
