import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gerald/core/utils/routes_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _decideNextScreen();
  }

  Future<void> _decideNextScreen() async {
    // Delay before deciding the next screen
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      // Check if bearer token is available
      String? token = prefs.getString('bearer_token');
      bool isTokenAvailable = token != null && token.isNotEmpty;

      if (isTokenAvailable) {
        Get.offNamed(NavigationRoute.mainMenu);
      } else {
        Get.offNamed(NavigationRoute.login);
      }
    } else {
      Get.offNamed(NavigationRoute.onboarding);
    }
  }
}
