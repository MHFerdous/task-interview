import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/presentation/controllers/password_strength_checker_controller.dart';

class PasswordFieldWithStrength extends StatelessWidget {
  final passStrengthController = Get.put(PasswordStrengthController());

  PasswordFieldWithStrength({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: passStrengthController.progressValue,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              passStrengthController.strengthColor,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            passStrengthController.strengthLabel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: passStrengthController.strengthColor,
            ),
          ),
          const SizedBox(height: 8),

          // Condition Row
          Row(
            children: [
              Icon(
                passStrengthController.password.value.length >= 8
                    ? Icons.check_circle
                    : Icons.cancel,
                color:
                    passStrengthController.password.value.length >= 8
                        ? Colors.green
                        : Colors.grey,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                "At least 8 characters with letters & numbers",
                style: TextStyle(
                  color:
                      passStrengthController.password.value.length >= 8
                          ? Colors.green
                          : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
