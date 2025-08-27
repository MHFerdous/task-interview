import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/enable_location_screen.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_one.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _delay();
  }

  void _delay() async {
    final session = Supabase.instance.client.auth.currentSession;
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    if (session != null) {
      Get.offAll(
        () => EnableLocationScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      if (mounted) {
        Get.offAll(
          () => OnboardingScreenOne(),
          transition: Transition.rightToLeft,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.026,
            vertical: SizeConfig.screenHeight * 0.026,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.185),
                CustomImage(
                  width: 0.140,
                  height: 0.140,
                  icon: ImageAssets.carIconSVG,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.016),
                CustomHeaderText(text: 'Theory test in my language'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                CustomSubHeaderText(
                  text:
                      'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                CircularProgressIndicator(color: AppColors.primaryColor),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
