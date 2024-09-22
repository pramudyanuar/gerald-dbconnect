import 'package:flutter/material.dart';
import 'package:gerald/pages/profile/profile_screen.dart';
import 'package:gerald/pages/officer_view/explore/officer_explore_view.dart';
import 'package:gerald/pages/officer_view/notification/officer_notification_view.dart';
import 'package:gerald/pages/officer_view/report/officer_report_view.dart';
import 'package:gerald/pages/supervisor_view/explore/supervisor_explore_view.dart';
import 'package:gerald/pages/supervisor_view/notification/supervisor_notification_view.dart';
import 'package:gerald/pages/supervisor_view/report/supervisor_report_view.dart';
import 'package:gerald/core/helpers/bottom_nav_controller.dart';

Widget getBody(NavController navController, String role) {
  switch (navController.selectedIndex.value) {
    case 0:
      return role == 'pengawas' ? const SupervisorExploreView() : OfficerExploreView();
    case 1:
      return role == 'pengawas' ? const SupervisorReportView() : OfficerReportView();
    case 2:
      return role == 'pengawas' ? SupervisorNotificationView() : OfficerNotificationView();
    case 3:
      return ProfileScreen();
    default:
      return const SizedBox.shrink();
  }
}
