import 'package:get/get.dart';

class BasicController extends GetxController {
  var trackerCounter = 0.obs;

  void increment() {
    trackerCounter++;
  }

  void decrement() {
    if (trackerCounter > 0) {
      trackerCounter--;
    }
  }
}
