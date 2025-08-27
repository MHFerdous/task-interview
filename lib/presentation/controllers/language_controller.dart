import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedIndex = 0.obs;

  void selectLanguage(int index) {
    selectedIndex.value = index;
  }
}
