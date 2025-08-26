import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_two.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/image_and_icon.dart';
import 'package:interview/presentation/widgets/navigation_animation.dart';
import 'package:interview/presentation/widgets/subHeader_text.dart';
import 'package:interview/presentation/widgets/header_text.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.185),
                ImageAndIcon(
                  width: 0.330,
                  height: 0.330,
                  icon: ImageAssets.onboardingImageOneSVG,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.056),
                HeaderText(text: 'Best online courses in the world'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                SubHeaderText(
                  text:
                      'Now you can learn anywhere, anytime, even if there is no internet access!',
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
                    Get.to(NavigationAnimation(screen: OnboardingScreenTwo()));
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
