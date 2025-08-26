import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';
import 'package:interview/presentation/screen/auth_screens/forgot_password_screen.dart';
import 'package:interview/presentation/screen/auth_screens/reset_password_screen.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/screen/auth_screens/signup_screen.dart';
import 'package:interview/presentation/screen/auth_screens/verify_code_screen.dart';
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
      home: VerifyCodeScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            minimumSize: Size(double.infinity, SizeConfig.screenWidth * 0.072),
            textStyle: TextStyles.subHeader,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Color(0xFFCBD5E1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          labelStyle: TextStyle(color: AppColors.titleColors),
          hintStyle: TextStyle(color: AppColors.titleColors),
        ),
      ),
    );
  }
}
