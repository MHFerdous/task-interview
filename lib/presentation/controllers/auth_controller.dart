import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  var rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    rememberMe.value = storage.read('rememberMe') ?? false;
  }

  void toggleRemember(bool value) {
    rememberMe.value = value;
    storage.write('rememberMe', value);
  }

  bool isUserRemembered() {
    return rememberMe.value;
  }
}
