import 'package:gerald/data/dummydata.dart';
import 'package:get/get.dart';

class PumpHouseController extends GetxController {

  var searchResults = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchResults.value = pumpHouseData;
  }

  void searchPumpHouse(String query) {
    if (query.isEmpty) {
      searchResults.value = pumpHouseData;
    } else {
      searchResults.value = pumpHouseData.where((pumpHouse) {
        return pumpHouse['title']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void addPumpHouse(String name) {
    pumpHouseData.add({"title": name});
    searchResults.value = pumpHouseData;
  }
}
