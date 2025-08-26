import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/screen/auth_screens/verify_code_screen.dart';
import 'package:interview/presentation/widgets/header_text.dart';
import 'package:interview/presentation/widgets/navigation_animation.dart';
import 'package:interview/presentation/widgets/subHeader_text.dart';
import 'package:interview/presentation/widgets/text_field.dart';
import 'package:interview/presentation/widgets/title_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTEController = TextEditingController();

  final _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.026,
              vertical: SizeConfig.screenHeight * 0.020,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.012),

                        HeaderText(text: 'Forgot Password'),
                        SizedBox(height: SizeConfig.screenHeight * 0.008),
                        SubHeaderText(
                          text:
                              'Enter your email, we will send a verification code to email',
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.036),
                      ],
                    ),
                  ),
                  TitleText(text: 'Email Address'),
                  SizedBox(height: SizeConfig.screenHeight * 0.010),
                  CustomTextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      } else if (!_emailRegex.hasMatch(value)) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.040),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(NavigationAnimation(screen: VerifyCodeScreen()));
                    },
                    child: Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
