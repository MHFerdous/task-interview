import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_one.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/image_and_icon.dart';
import 'package:interview/presentation/widgets/navigation_animation.dart';
import 'package:interview/presentation/widgets/subtitle_text.dart';
import 'package:interview/presentation/widgets/title_text.dart';

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
    //final session = Supabase.instance.client.auth.currentSession;
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Get.offAll(NavigationAnimation(screen: OnboardingScreenOne()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.020,
            vertical: SizeConfig.screenHeight * 0.020,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.185),
                ImageAndIcon(
                  width: 0.140,
                  height: 0.140,
                  icon: ImageAssets.carIconSVG,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.016),
                TitleText(text: 'Theory test in my language'),
                SizedBox(height: SizeConfig.screenHeight * 0.008),
                SubtitleText(
                  text:
                      'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
