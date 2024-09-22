import 'package:gerald/data/dummydata.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  
  List<String> roles = ['Pengawas', 'Petugas', 'Admin'];
  var selectedRole = 'Pengawas'.obs;
  var searchResults = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchResults.value = users;
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      searchResults.value = users;
    } else {
      searchResults.value = users.where((user) {
        return user['name']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void addUser(String name, String role) {
    users.add({"name": name, "role": role});
    searchResults.value = users;
  }
}
