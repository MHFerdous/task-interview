import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PasswordStrength { weak, medium, strong }

class PasswordStrengthController extends GetxController {
  var password = ''.obs;
  var strength = PasswordStrength.weak.obs;

  void checkPassword(String value) {
    password.value = value;

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters = value.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    bool hasMinLength = value.length >= 8;

    int strengthPoints = 0;
    if (hasDigits) strengthPoints++;
    if (hasUppercase) strengthPoints++;
    if (hasLowercase) strengthPoints++;
    if (hasSpecialCharacters) strengthPoints++;
    if (hasMinLength) strengthPoints++;

    if (strengthPoints <= 2) {
      strength.value = PasswordStrength.weak;
    } else if (strengthPoints <= 4) {
      strength.value = PasswordStrength.medium;
    } else {
      strength.value = PasswordStrength.strong;
    }
  }

  double get progressValue {
    switch (strength.value) {
      case PasswordStrength.weak:
        return 0.3;
      case PasswordStrength.medium:
        return 0.6;
      case PasswordStrength.strong:
        return 1.0;
    }
  }

  String get strengthLabel {
    switch (strength.value) {
      case PasswordStrength.weak:
        return "Weak";
      case PasswordStrength.medium:
        return "Medium";
      case PasswordStrength.strong:
        return "Strong";
    }
  }

  Color get strengthColor {
    switch (strength.value) {
      case PasswordStrength.weak:
        return Colors.red;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.green;
    }
  }
}
