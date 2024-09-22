import 'package:get/get.dart';

class EditpumpdetailController extends GetxController {
  final Map<String, dynamic> pumpData = {
    'nama': 'Rumah Pompa Petekan',
    'alamat': 'Alamat Rumah Pompa',
    'waterLevel': 90.obs,
    'sensorHeight': 120.obs,
    'pumpActive': 8.obs,
    'maxPump': 10,
    'tresshold': 120,
  };

  void incrementWaterLevel() {
    pumpData['waterLevel'].value++;
  }

  void decrementWaterLevel() {
    if (pumpData['waterLevel'].value > 0) {
      pumpData['waterLevel'].value--;
    }
  }

  void incrementSensorHeight() {
    pumpData['sensorHeight'].value++;
  }

  void decrementSensorHeight() {
    if (pumpData['sensorHeight'].value > 0) {
      pumpData['sensorHeight'].value--;
    }
  }

  void incrementPump() {
    if (pumpData['pumpActive'].value < pumpData['maxPump']) {
      pumpData['pumpActive'].value++;
    }
  }

  void decrementPump() {
    if (pumpData['pumpActive'].value > 0) {
      pumpData['pumpActive'].value--;
    }
  }

  void updatePumpData(String nama, String alamat) {
    pumpData['nama'] = nama;
    pumpData['alamat'] = alamat;
  }
}
