import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_one.dart';
import 'package:interview/presentation/screen/welcome_screens/onboarding_screen_two.dart';
import 'package:interview/presentation/screen/welcome_screens/splash_screen.dart';
import 'package:interview/presentation/utility/app_colors.dart';

import 'app/styling/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreenTwo(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            minimumSize: Size(double.infinity, SizeConfig.screenWidth * 0.072),
            textStyle: TextStyles.subTitle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
