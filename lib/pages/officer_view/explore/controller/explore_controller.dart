import 'package:get/get.dart';

class SwitchController extends GetxController {
  var isSwitchedOn = true.obs;

  void toggleSwitch() {
    isSwitchedOn.value = !isSwitchedOn.value;
  }
}
