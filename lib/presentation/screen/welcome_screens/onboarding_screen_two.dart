import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.12),
                CustomImage(
                  width: 0.330,
                  height: 0.330,
                  icon: ImageAssets.onboardingImageTwoSVG,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.056),
                CustomHeaderText(text: 'Explore your new skill\ntoday'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                CustomSubHeaderText(
                  text:
                      'Our platform is designed to help you explore new skills. Let’s learn & grow with Eduline!',
                  textAlign: TextAlign.center,
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
                    Get.offAll(
                      () => SigninScreen(),
                      transition: Transition.rightToLeft,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                    );
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
