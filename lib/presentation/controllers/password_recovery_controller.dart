import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:interview/presentation/screen/auth_screens/reset_password_screen.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/screen/auth_screens/success_popup_screen.dart';
import 'package:interview/presentation/screen/auth_screens/verify_code_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordRecoveryController extends GetxController {
  final email = ''.obs;
  final code = ''.obs;
  final newPassword = ''.obs;
  final confirmPassword = ''.obs;
  final isLoading = false.obs;

  Future<void> sendResetCode(String email) async {
    isLoading.value = true;

    try {
      await Supabase.instance.client.auth.resetPasswordForEmail(email.trim());

      Get.snackbar('Success', 'OTP has been sent to your email');
      Get.to(() => VerifyCodeScreen(email: email));
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP to your email');
    }
    isLoading.value = false;
  }

  Future<void> verifyCode(String email, otp) async {
    isLoading.value = true;

    try {
      await Supabase.instance.client.auth.verifyOTP(
        email: email.trim(),
        token: otp.text,
        type: OtpType.recovery,
      );

      Get.snackbar('Success', 'OTP matched');
      Get.to(() => ResetPasswordScreen());
    } catch (e) {
      Get.snackbar(e.toString(), 'Failed to match OTP');
    }

    isLoading.value = false;
  }

  Future<void> resetPassword(String pass, newPass) async {
    if (pass != newPass) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: pass),
      );
      Get.snackbar('Success', 'Password changed successfully');
      Get.dialog(
        SuccessPopupScreen(
          title: "Successfully Changed password",
          message: "Welcome here",
          onContinue: () {
            Get.back();
            Get.offAll(
              () => SigninScreen(),
              transition: Transition.rightToLeft,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 500),
            );
          },
        ),
        barrierDismissible: false,
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to change password');
    }

    isLoading.value = false;
  }
}
