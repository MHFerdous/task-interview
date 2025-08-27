import 'package:flutter/material.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';

class SuccessPopupScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onContinue;

  const SuccessPopupScreen({
    super.key,
    required this.title,
    required this.message,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.026,
          vertical: SizeConfig.screenHeight * 0.020,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(
              width: SizeConfig.screenHeight * 0.0005,
              height: SizeConfig.screenHeight * 0.0002,
              icon: ImageAssets.successPopupIcon,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.024),
            CustomHeaderText(text: title, fontWeight: FontWeight.w600),
            SizedBox(height: SizeConfig.screenHeight * 0.008),
            CustomSubHeaderText(text: message),
            SizedBox(height: SizeConfig.screenHeight * 0.022),
            ElevatedButton(
              onPressed: onContinue,
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
