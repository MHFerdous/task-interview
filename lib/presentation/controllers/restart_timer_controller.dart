import 'dart:async';
import 'package:get/get.dart';

class RestartTimerController extends GetxController {
  final remaining = 120.obs;
  final isButtonEnabled = false.obs;
  Timer? _timer;

  void startTimer(int seconds) {
    remaining.value = seconds;
    isButtonEnabled.value = false;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remaining.value == 0) {
        timer.cancel();
        isButtonEnabled.value = true;
      } else {
        remaining.value--;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
