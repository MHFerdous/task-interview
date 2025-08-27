import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:interview/presentation/screen/auth_screens/success_popup_screen.dart';
import 'package:interview/presentation/screen/enable_location_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  var isLoading = false.obs;

  Future<void> signUp(String email, String password, String fullName) async {
    try {
      isLoading.value = true;

      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );

      if (response.user != null) {
        Get.dialog(
          SuccessPopupScreen(
            title: "Successfully Registered",
            message:
                "Your account has been registered successfully, now let’s enjoy our features!",
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
      Get.snackbar("Error", "Failed to create account! Please try again.");
      print(e.toString());
    } catch (e) {
      Get.snackbar("Error", "Failed to create account! Please try again.");
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
