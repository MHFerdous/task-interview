import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:interview/presentation/screen/auth_screens/success_popup_screen.dart';
import 'package:interview/presentation/screen/enable_location_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  var isLoading = false.obs;

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;

      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Get.dialog(
          SuccessPopupScreen(
            title: "Successfully Signed In",
            message: "Welcome here",
            onContinue: () {
              Get.back();
              Get.offAll(
                () => EnableLocationScreen(),
                transition: Transition.rightToLeft,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          barrierDismissible: false,
        );
      }
    } on AuthException catch (e) {
      Get.snackbar("Error", "Failed to sign in! Please try again.");
      print(e.toString());
    } catch (e) {
      Get.snackbar("Error", "Failed to sign in! Please try again.");
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
