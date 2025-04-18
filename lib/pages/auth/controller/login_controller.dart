import 'package:flutter/widgets.dart';
import 'package:gerald/core/services/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gerald/core/utils/routes_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isHidden = true.obs;

  // Method untuk toggle visibility password
  void showPassword() {
    isHidden.value = !isHidden.value;
  }

  // Method untuk login dan mengambil token
  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      // Membuat request ke API login
      var response = await http.post(
        Uri.parse(ApiEndpoints.authLogin),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Jika login berhasil, ambil token dan user dari respons
        var data = json.decode(response.body);

        // Access token is a string, not an object
        String? accessToken = data['access_token'];
        var userData = data['user'];

        if (accessToken != null && userData != null) {
          print(userData['role']);

          // Simpan token dan data user ke SharedPreferences
          await _saveToken(accessToken);
          await _saveUserData(userData);

          // Pindah ke halaman utama setelah login
          Get.offAllNamed(
            NavigationRoute.mainMenu, 
            arguments: {'role': userData['role']}
          );
        } else {
          Get.snackbar('Error', 'Invalid response data.');
        }
      } else {
        // Jika login gagal, tampilkan pesan error
        Get.snackbar('Login Failed', 'Invalid credentials or server error');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    }
  }

  // Method untuk menyimpan token ke SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bearer_token', token);
    print("Token disimpan: $token");
  }

  // Method untuk menyimpan data user ke SharedPreferences
  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userData['id']);
    await prefs.setString('username', userData['username']);
    await prefs.setString('email', userData['email']);
    await prefs.setString('no_telepon', userData['no_telepon']);
    await prefs.setString('role', userData['role']);
    // Saving additional data like address if needed
    await prefs.setString('alamat', userData['alamat']);
    
    // Ensure that `rumah_pompa` is a list and not empty before accessing
    if (userData['rumah_pompa'] is List && userData['rumah_pompa'].isNotEmpty) {
      // Save the first element of rumah_pompa as string
      String rumahPompa = userData['rumah_pompa'][0].toString();
      await prefs.setString('rumah_pompa', rumahPompa);
      print("Rumah pompa disimpan: $rumahPompa");
    } else {
      print("Rumah pompa tidak tersedia atau kosong.");
    }
    
    print("User data disimpan: $userData");
  }

  // Method untuk mengambil token dari SharedPreferences (jika diperlukan)
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearer_token');
  }

  // Method untuk mengambil data user dari SharedPreferences (jika diperlukan)
  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'user_id': prefs.getInt('user_id'),
      'username': prefs.getString('username'),
      'email': prefs.getString('email'),
      'no_telepon': prefs.getString('no_telepon'),
      'role': prefs.getString('role'),
      'alamat': prefs.getString('alamat'), 
      'rumah_pompa': prefs.getString('rumah_pompa'), // Retrieve stored rumah_pompa
    };
  }
}
