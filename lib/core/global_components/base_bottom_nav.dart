// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/helpers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          selectedItemColor: const Color(0xFF006FFD),
          unselectedItemColor: const Color(0xFFD4D6DD),
          selectedLabelStyle: TextStyle(color: const Color(0xFF000000), fontSize: 12.sp),
          unselectedLabelStyle: TextStyle(color: const Color(0xFFD4D6DD), fontSize: 10.sp),
          showUnselectedLabels: true,
          currentIndex: navController.selectedIndex.value,
          onTap: (index) => navController.changeTabIndex(index),
          items:  const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Eksplor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ));
  }
}