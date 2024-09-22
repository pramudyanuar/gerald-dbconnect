import 'package:gerald/pages/admin/main_menu.dart';
import 'package:gerald/pages/admin/pump_house/pump_house_detail.dart';
import 'package:gerald/pages/admin/pump_house/pump_house_menu.dart';
import 'package:gerald/pages/auth/forgotpass_screen.dart';
import 'package:gerald/pages/auth/login_screen.dart';
import 'package:gerald/pages/main/main_menu_screen.dart';
import 'package:gerald/pages/main/onboarding_screen.dart';
import 'package:gerald/pages/main/splash_screen.dart';
import 'package:gerald/pages/officer_view/explore/edit_pump.dart';
import 'package:gerald/pages/officer_view/explore/pump_house_detail.dart';
import 'package:gerald/pages/officer_view/report/officer_report_view.dart';
import 'package:gerald/pages/officer_view/report/make_report_screen.dart';
import 'package:gerald/pages/profile/about_gerald.dart';
import 'package:gerald/pages/profile/detail_profile.dart';
import 'package:gerald/pages/profile/edit_profile.dart';
import 'package:gerald/pages/profile/tnc_and_pp.dart';
import 'package:gerald/pages/supervisor_view/explore/pump_station_detail.dart';
import 'package:gerald/pages/supervisor_view/report/detail_report.dart';
import 'package:gerald/pages/supervisor_view/report/report_list.dart';
import 'package:gerald/pages/supervisor_view/report/supervisor_report_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class NavigationRoute {
  static String initial = '/';
  static String onboarding = '/onboarding';
  static String login = '/login';
  static String forgotpass = '/forgotpass';
  static String mainMenu = '/mainMenu';
  static String pumpDetail = '/pumpdetail';
  static String detailprofile = '/detailprofile';
  static String editprofile = '/editprofile';
  static String pumphousedetail = '/pumphousedetail';
  static String editpump = '/editpump';
  static String makereport = '/makereport';
  static String officerreport = '/officerreport';
  static String supervisorreport = '/supervisorreport';
  static String detailreport = '/detailreport';
  static String admin = '/admin';
  static String aboutGerald = '/aboutgerald';
  static String tncpp = '/tncpp';
  static String reportlist = '/reportlist';
  static String adminpumplist = '/adminpumplist';
  static String adminpumphouse = '/adminpumphouse';
  static String adminmenu = '/adminmenu';



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: forgotpass, page: () => ForgotpassScreen()),
    GetPage(name: mainMenu, page: () => const MainMenuScreen()),
    GetPage(name: pumpDetail, page: () => const PumpStationDetailScreen()),
    GetPage(name: detailprofile, page: () => DetailProfileScreen()),
    GetPage(name: editprofile, page: () => EditProfileScreen()),
    GetPage(name: pumphousedetail, page: () => PumpHouseScreen()),
    GetPage(name: editpump, page: () => EditPumpScreen()),
    GetPage(name: makereport, page: () =>  MakeReportScreen()),
    GetPage(name: officerreport, page: () => OfficerReportView()),
    GetPage(name: detailreport, page: () => const DetailReportScreen()),
    GetPage(name: admin, page: () => const AdminMainMenuScreen()),
    GetPage(name: aboutGerald, page: () => const AboutGerald()),
    GetPage(name: tncpp, page: () => const TncAndPp()),
    GetPage(name: supervisorreport, page: () => const SupervisorReportView()),
    GetPage(name: reportlist, page: () => ReportListScreen()),
    GetPage(name: adminpumplist, page: () => ManagePumpHouseScreen()),
    GetPage(name: adminpumphouse, page: () => AdminPumpStationDetail()),
    GetPage(name: adminmenu, page: () => const AdminMainMenuScreen()),
  ];
}