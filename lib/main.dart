import 'package:flutter/material.dart';
import 'package:gerald/core/config/my_app.dart';
import 'package:gerald/core/services/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await NotificationService.init();
  runApp(const MainApp() );
}
