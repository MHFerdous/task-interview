import 'package:flutter/material.dart';
import 'package:interview/presentation/utility/app_colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.headerColor,
  );
  static TextStyle coHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.headerColor,
  );

  static TextStyle subHeader = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.subHeaderColor,
  );
  static TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.subHeaderColor,
    letterSpacing: 0.3,
  );
}
