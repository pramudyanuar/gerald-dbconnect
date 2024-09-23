import 'dart:convert';
import 'package:gerald/core/services/api_endpoints.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PumpHouseController extends GetxController {
  var searchResults = <Map<String, dynamic>>[].obs;
  var isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPumpHouseData();
  }

  Future<void> fetchPumpHouseData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('bearer_token');
    

    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.getAllPump),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          final List<dynamic> pumpHouseList = data['data'];
          searchResults.value = pumpHouseList.map((item) {
            return {
              'id_rumah_pompa': item['id_rumah_pompa'].toString(),
              'title': item['nama_rumah'],
              'weather': 'N/A',
              'waterLevel': item['ketinggian_sensor'].toString(),
            };
          }).toList();
        } else {
          print('Failed to load data: ${data['message']}');
        }
      } else {
        // Handle HTTP errors
        print('Failed to load data: HTTP ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error fetching data: $e');
    }
  }

  void startSearching() {
    isSearching.value = true;
  }

  void stopSearching() {
    isSearching.value = false;
    search('');
  }

  void search(String query) {
    if (query.isEmpty) {
      fetchPumpHouseData();
    } else {
      searchResults.value = searchResults.where((item) {
        return item['title']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void gotoPumpDetail(String pumpHouseId) {
    Get.offAllNamed(
      NavigationRoute.pumpDetail,
      arguments: {'pumpHouseId': pumpHouseId},
    );
  }
}
