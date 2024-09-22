import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final storedRole = prefs.getString('role');

    if (storedRole != null && storedRole.isNotEmpty) {
      role.value = storedRole;
    } else {
      Get.offAllNamed('/login');
    }
  }
}
