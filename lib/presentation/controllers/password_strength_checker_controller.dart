import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StrengthLevel { none, weak, medium, strong, great }

class PasswordStrengthCheckerController extends GetxController {
  var strength = StrengthLevel.none.obs;
  var strengthPercent = 0.0.obs;
  var strengthText = "".obs;

  final letterReg = RegExp(r".*[A-Za-z].*");
  final digitReg = RegExp(r".*[0-9].*");

  void checkPassword(String pw) {
    if (pw.isEmpty) {
      strength.value = StrengthLevel.none;
      strengthPercent.value = 0.0;
      strengthText.value = 'Enter a password';
    } else if (pw.length < 6) {
      strength.value = StrengthLevel.weak;
      strengthPercent.value = 0.25;
      strengthText.value = 'Too short';
    } else if (pw.length < 8) {
      strength.value = StrengthLevel.medium;
      strengthPercent.value = 0.5;
      strengthText.value = 'Could be stronger';
    } else {
      final hasLet = letterReg.hasMatch(pw);
      final hasDgt = digitReg.hasMatch(pw);
      if (!hasLet || !hasDgt) {
        strength.value = StrengthLevel.strong;
        strengthPercent.value = 0.75;
        strengthText.value = 'Strong';
      } else {
        strength.value = StrengthLevel.great;
        strengthPercent.value = 1.0;
        strengthText.value = 'Great';
      }
    }
  }

  Color get strengthColor {
    switch (strength.value) {
      case StrengthLevel.weak:
        return Colors.red;
      case StrengthLevel.medium:
        return Colors.orange;
      case StrengthLevel.strong:
        return Colors.blue;
      case StrengthLevel.great:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
