import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/controllers/signin_controller.dart';
import 'package:interview/presentation/screen/auth_screens/forgot_password_screen.dart';
import 'package:interview/presentation/screen/auth_screens/signup_screen.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_text_button.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_text_form_field.dart';
import 'package:interview/presentation/widgets/custom_title_text.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTEController = TextEditingController();

  final _passwordTEController = TextEditingController();

  final _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  final _signinController = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.026,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.185),
                        CustomImage(
                          width: 0.0850,
                          height: 0.0850,
                          icon: ImageAssets.signinScreenIconSVG,
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.016),
                        CustomHeaderText(text: 'Welcome Back!', size: 32),
                        SizedBox(height: SizeConfig.screenHeight * 0.008),
                        CustomSubHeaderText(
                          text: 'Please login first to start your Theory Test.',
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.041),
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
                  SizedBox(height: SizeConfig.screenHeight * 0.016),

                  TitleText(text: 'Password'),
                  SizedBox(height: SizeConfig.screenHeight * 0.010),
                  CustomTextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.done,
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    isPasswordField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      } else if (value.length < 6) {
                        return 'Password length greater than 6';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.016),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [CustomSubHeaderText(text: 'Remember Me')]),
                      CustomTextButton(
                        text: 'Forgot Password',
                        color: AppColors.subHeaderColor,
                        onPressed: () {
                          Get.to(() => ForgotPasswordScreen());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.024),

                  Obx(
                    () => ElevatedButton(
                      onPressed:
                          _signinController.isLoading.value
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  _signinController.signUp(
                                    _emailTEController.text.trim(),
                                    _passwordTEController.text.trim(),
                                  );
                                }
                                /*Get.offAll(
                            () => EnableLocationScreen(),
                        transition: Transition.rightToLeft,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500),
                      );*/
                              },
                      child: Text('Sign In'),
                    ),
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.016),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSubHeaderText(text: 'New to Theory Test?  '),
                      CustomTextButton(
                        text: 'Create Account',
                        color: AppColors.primaryColor,
                        onPressed: () {
                          Get.to(
                            () => SignupScreen(),
                            transition: Transition.rightToLeft,
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 500),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
