import 'package:flutter/material.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/custom_dialog.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var userData = <String, dynamic>{}.obs;
  var isLoading = true.obs; // Tambahkan loading state

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  // Method untuk mengambil data user dari SharedPreferences
  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Ambil data dari SharedPreferences
      userData['user_id'] = prefs.getInt('user_id');
      userData['username'] = prefs.getString('username') ?? '';
      userData['email'] = prefs.getString('email') ?? '';
      userData['no_telepon'] = prefs.getString('no_telepon') ?? '';
      userData['role'] = prefs.getString('role') ?? '';

      print("User data berhasil dimuat: $userData");
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data pengguna: $e');
    } finally {
      isLoading.value = false; // Set loading state ke false saat data sudah selesai di-load
    }
  }

  // Method untuk logout dan hapus data dari SharedPreferences
  Future<void> logout() async {
    Get.dialog(CustomDialog(
      title: ProfileScreenText.signOut,
      message: ProfileScreenText.signOutMessage,
      leftButtonText: ProfileScreenText.cancel,
      rightButtonText: ProfileScreenText.confirmation,
      leftButtonColor: Colors.black,
      rightButtonColor: Colors.white,
      leftButtonTextColor: Colors.white,
      rightButtonTextColor: Colors.blue,
      onLeftButtonPressed: () {
        Get.back();
      },
      onRightButtonPressed: () async {
        try {
          final prefs = await SharedPreferences.getInstance();
          bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
          await prefs.clear();
          await prefs.setBool('hasSeenOnboarding', hasSeenOnboarding);
          Get.offAllNamed(NavigationRoute.login);
        } catch (e) {
          Get.snackbar('Error', 'Gagal melakukan logout: $e');
        }
      }
    ));
  }
}
