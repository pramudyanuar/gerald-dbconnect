import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MyApp();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gerald',
      initialRoute: NavigationRoute.initial,
      getPages: NavigationRoute.routes,
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
    );
  }
}