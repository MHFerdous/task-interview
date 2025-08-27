import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_two.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';

class OnboardingScreenOne extends StatefulWidget {
  const OnboardingScreenOne({super.key});

  @override
  State<OnboardingScreenOne> createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.026,
            vertical: SizeConfig.screenHeight * 0.020,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.12),
                CustomImage(
                  width: 0.340,
                  height: 0.340,
                  icon: ImageAssets.onboardingImageOneSVG,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.056),
                CustomHeaderText(text: 'Best online courses \nin the world'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                CustomSubHeaderText(
                  text:
                      'Now you can learn anywhere, anytime, even if there is no internet access!',
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.040),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,

                  children: [
                    CircleAvatar(radius: 4, backgroundColor: Color(0xFF1B6EF7)),

                    CircleAvatar(radius: 4, backgroundColor: Color(0xFFCCE2FF)),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.064),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => OnboardingScreenTwo(),
                      transition: Transition.rightToLeft,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
