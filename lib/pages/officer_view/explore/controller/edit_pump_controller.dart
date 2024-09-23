import 'package:gerald/pages/officer_view/explore/controller/explore_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gerald/core/services/api_endpoints.dart';

class EditPumpController extends GetxController {
  var pumpName = ''.obs;
  var pumpAddress = ''.obs;
  var waterLevel = 0.obs;
  var sensorHeight = 0.obs;
  var pumpActive = 0.obs;
  var maxPump = 0;

  // Method to initialize pump data (fetch from shared preferences or passed arguments)
  Future<void> initializePumpData() async {
    final prefs = await SharedPreferences.getInstance();
    final pumpHouseDetailJson = prefs.getString('pumpHouseDetail');

    if (pumpHouseDetailJson != null) {
      final data = jsonDecode(pumpHouseDetailJson);

      // Assign data to Rx variables
      pumpName.value = data['nama_rumah'] ?? '';
      pumpAddress.value = data['alamat'] ?? '';
      waterLevel.value = data['threshold'] ?? 0;
      sensorHeight.value = data['ketinggian_sensor'] ?? 0;
      pumpActive.value = data['pompa']?[0]['jumlah_pompa_hidup'] ?? 0;
      maxPump = data['pompa']?[0]['jumlah_total_pompa'] ?? 0;
    }
  }

  void incrementWaterLevel() {
    waterLevel.value++;
  }

  void decrementWaterLevel() {
    if (waterLevel.value > 0) {
      waterLevel.value--;
    }
  }

  void incrementSensorHeight() {
    sensorHeight.value++;
  }

  void decrementSensorHeight() {
    if (sensorHeight.value > 0) {
      sensorHeight.value--;
    }
  }

  void incrementPump() {
    if (pumpActive.value < maxPump) {
      pumpActive.value++;
    }
  }

  void decrementPump() {
    if (pumpActive.value > 0) {
      pumpActive.value--;
    }
  }

  // Method to save general pump house data to the server
  Future<void> savePumpHouseData(int pumpHouseId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('bearer_token');

    final url = '${ApiEndpoints.getPumpDetailOfficer}/$pumpHouseId';
    print('Saving pump house data to URL: $url');

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nama_rumah': pumpName.value,
          'alamat': pumpAddress.value,
          'threshold': waterLevel.value,
          'ketinggian_sensor': sensorHeight.value,
          'pompa': [
            {
              'jumlah_pompa_hidup': pumpActive.value,
              'jumlah_total_pompa': maxPump,
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        print('Pump house data saved successfully: ${response.body}');
        Get.snackbar('Success', 'Pump house data updated successfully.');
        
        // Refresh data in PumpHouseController
        Get.find<PumpHouseController>().loadPumpHouseDataFromPrefs();
      } else {
        print('Failed to save pump house data: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to update pump house data.');
      }
    } catch (e) {
      print('Error while saving pump house data: $e');
      Get.snackbar('Error', 'Something went wrong while saving pump house data.');
    }
  }

  // Method to save pump-specific data to the pump endpoint
  Future<void> savePumpData(int pumpId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('bearer_token');

    final url = '${ApiEndpoints.updatePump}/$pumpId';
    print('Saving pump data to URL: $url');

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'jumlah_pompa_hidup': pumpActive.value,
          'jumlah_pompa_mati': maxPump - pumpActive.value,
        }),
      );

      if (response.statusCode == 200) {
        print('Pump data saved successfully: ${response.body}');
        Get.snackbar('Success', 'Pump data updated successfully.');
        
        // Optionally refresh data in PumpHouseController if needed
        Get.find<PumpHouseController>().loadPumpHouseDataFromPrefs();
      } else {
        print('Failed to save pump data: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to update pump data.');
      }
    } catch (e) {
      print('Error while saving pump data: $e');
      Get.snackbar('Error', 'Something went wrong while saving pump data.');
    }
  }
}
