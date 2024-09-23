import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gerald/core/services/api_endpoints.dart';
import 'package:gerald/pages/profile/controller/profile_controller.dart';

class PumpHouseController extends GetxController {
  var pumpHouseDetail = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _observePumpHouseId();
  }

  Future<void> loadPumpHouseDataFromPrefs() async {
    isLoading.value = true;  // Start loading

    try {
      final prefs = await SharedPreferences.getInstance();
      String? pumpHouseDetailJson = prefs.getString('pumpHouseDetail');

      if (pumpHouseDetailJson != null) {
        // Decode JSON and update the observable
        final data = jsonDecode(pumpHouseDetailJson);
        pumpHouseDetail.value = data;
        print('Data loaded from SharedPreferences: $data');
      } else {
        errorMessage.value = 'Pump house data not found in local storage.';
        print('Pump house data not found in SharedPreferences.');
      }
    } catch (e) {
      errorMessage.value = 'Failed to load pump house data: $e';
      print('Error loading pump house data from SharedPreferences: $e');
    } finally {
      isLoading.value = false;  // Stop loading
    }
  }

  void _observePumpHouseId() {
    final profileController = Get.find<ProfileController>();

    // Listen to changes in userData['rumah_pompa']
    ever(profileController.userData, (userData) {
      final String? pumpHouseId = userData['rumah_pompa'];

      if (pumpHouseId != null && pumpHouseId.isNotEmpty) {
        fetchPumpHouseDetail(pumpHouseId);
      } else {
        errorMessage.value = 'Pump house ID is not available.';
        isLoading.value = false;
      }
    });
  }

  Future<void> fetchPumpHouseDetail(String pumpHouseId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('bearer_token');
    final url = '${ApiEndpoints.getPumpDetailOfficer}/$pumpHouseId';

    print('Request URL: $url');
    print('Authorization Token: $token');

    if (token == null || token.isEmpty) {
      errorMessage.value = 'Bearer token is not available. Please login again.';
      isLoading.value = false;
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = ''; // Clear previous error message

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        pumpHouseDetail.value = data; // Assign the response data to the observable

        // Save data to SharedPreferences
        await _savePumpHouseData(data);
      } else if (response.statusCode == 403) {
        errorMessage.value = 'Access denied: You do not have permission to access this resource.';
      } else {
        errorMessage.value = 'Failed to load data: HTTP ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _savePumpHouseData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('pumpHouseDetail', jsonEncode(data));
    await prefs.setString('nama_rumah', data['nama_rumah']);
    await prefs.setString('alamat', data['alamat']);
    await prefs.setInt('threshold', data['threshold']);
    await prefs.setInt('ketinggian_sensor', data['ketinggian_sensor']);

  if (data['prakiraan_cuaca'] != null) {
    List<dynamic> prakiraanCuacaList = data['prakiraan_cuaca'];
    
    // Hapus data lama
    await prefs.remove('prakiraan_cuaca_count');

    // Simpan jumlah item dalam list prakiraan cuaca
    await prefs.setInt('prakiraan_cuaca_count', prakiraanCuacaList.length);

    // Simpan setiap prakiraan cuaca sebagai item terpisah
    for (int i = 0; i < prakiraanCuacaList.length; i++) {
      await prefs.setString('prakiraan_cuaca_$i', jsonEncode(prakiraanCuacaList[i]));
    }
  }

    if (data['pompa'] != null) {
      await prefs.setString('pompa', jsonEncode(data['pompa']));
    }

    print("Pump house data saved to SharedPreferences");
  }

  Future<List<Map<String, dynamic>>> getPrakiraanCuaca() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> prakiraanCuacaList = [];

    // Dapatkan jumlah prakiraan cuaca yang tersimpan
    int? count = prefs.getInt('prakiraan_cuaca_count');
    if (count != null) {
      for (int i = 0; i < count; i++) {
        String? prakiraanString = prefs.getString('prakiraan_cuaca_$i');
        if (prakiraanString != null) {
          prakiraanCuacaList.add(jsonDecode(prakiraanString));
        }
      }
    }

    return prakiraanCuacaList;
  }
}
