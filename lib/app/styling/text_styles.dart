
import 'package:flutter/material.dart';
import 'package:interview/presentation/utility/app_colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.tertiaryColor,
  );

  static TextStyle subTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.quadrantColor,
  );
}
