import 'package:get/get.dart';

class OfficerReportController extends GetxController {
  var selectedIndex = 0.obs;
  // var tasks = <List<String>>[[], [], []].obs;

  var tasks = <List<String>>[
    ['Saluran tersumbat sampah', 'Pompa tidak berfungsi', 'Ketinggian air terlalu tinggi'],
    ['Drainase meluap saat hujan', 'Sedimen menumpuk di saluran', 'Pipa bocor di area X'],
    ['Kurangnya pemeliharaan rutinn', 'Penumpukan sampah di saluran', 'Sistem kontrol pompa gagal']
  ].obs;

  void addTask(String task) {
    tasks[0].add(task);
    tasks.refresh();
  }

  void updateTabIndex(int index) {
    selectedIndex.value = index;
  }
}
