import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/image_and_icon.dart';
import 'package:interview/presentation/widgets/navigation_animation.dart';
import 'package:interview/presentation/widgets/subtitle_text.dart';
import 'package:interview/presentation/widgets/title_text.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
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
                TitleText(text: 'Explore your new skill today'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                SubtitleText(
                  text:
                      'Our platform is designed to help you explore new skills. Let’s learn & grow with Eduline!',
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.040),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,

                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.secondaryColor,
                    ),

                    CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.064),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(NavigationAnimation(screen: SigninScreen()));
                  },
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
