import 'dart:convert';
import 'package:gerald/core/services/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PumpHouseDetailController extends GetxController {
  var pumpHouseDetail = {}.obs;
  var isLoading = true.obs; // Add this line

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPumpHouseDetail(String pumpHouseId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('bearer_token');
    final url = ApiEndpoints.getAllPump + '/$pumpHouseId';

    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          pumpHouseDetail.value = data['data'];
        } else {
          print('Failed to load data: ${data['message']}');
        }
      } else {
        print('Failed to load data: HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false; // Set loading to false after fetching data
    }
  }
}
