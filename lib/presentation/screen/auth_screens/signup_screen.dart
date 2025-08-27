import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/controllers/password_strength_checker_controller.dart';
import 'package:interview/presentation/controllers/signup_controller.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/widgets/custom_text_button.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:interview/presentation/widgets/custom_text_form_field.dart';
import 'package:interview/presentation/widgets/custom_title_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTEController = TextEditingController();

  final _fullNameTEController = TextEditingController();

  final _passwordTEController = TextEditingController();

  final _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  final _signupController = Get.put(SignupController());

  final _passwordController = Get.put(PasswordStrengthCheckerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
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
                  SizedBox(height: SizeConfig.screenHeight * 0.024),

                  CustomHeaderText(text: 'Welcome to Eduline'),
                  SizedBox(height: SizeConfig.screenHeight * 0.008),
                  CustomSubHeaderText(
                    text:
                        'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.036),
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
                  TitleText(text: 'Full Name'),
                  SizedBox(height: SizeConfig.screenHeight * 0.010),
                  CustomTextFormField(
                    controller: _fullNameTEController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Full Name',
                    textInputType: TextInputType.name,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your name';
                      } else if (value.length < 3) {
                        return 'Enter valid name';
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
                    onChanged: _passwordController.checkPassword,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.008),
                  Obx(
                    () => LinearProgressIndicator(
                      value: _passwordController.strengthPercent.value,
                      backgroundColor: Colors.grey[300],
                      color: _passwordController.strengthColor,
                      minHeight: 6,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.008),
                  Obx(
                    () => Text(
                      _passwordController.strengthText.value,
                      style: TextStyle(
                        color: _passwordController.strengthColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.024),

                  Obx(
                    () => ElevatedButton(
                      onPressed:
                          _signupController.isLoading.value
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  _signupController.signUp(
                                    _emailTEController.text.trim(),
                                    _passwordTEController.text.trim(),
                                    _fullNameTEController.text.trim(),
                                  );
                                }
                              },
                      child: Text('Sign Up'),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.016),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSubHeaderText(text: 'Already have an account?  '),
                      CustomTextButton(
                        text: 'Sign In',
                        onPressed: () {
                          Get.to(
                            () => SigninScreen(),
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
    _fullNameTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
