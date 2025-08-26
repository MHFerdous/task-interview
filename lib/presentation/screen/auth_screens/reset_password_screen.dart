import 'package:flutter/material.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/widgets/header_text.dart';
import 'package:interview/presentation/widgets/subHeader_text.dart';
import 'package:interview/presentation/widgets/text_field.dart';
import 'package:interview/presentation/widgets/title_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordTEController = TextEditingController();

  final _confirmPasswordTEController = TextEditingController();

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
                        HeaderText(text: 'Reset Password'),
                        SizedBox(height: SizeConfig.screenHeight * 0.008),
                        SubHeaderText(
                          text:
                              'Your password must be at least 8 characters long and include a combination of letters, numbers',
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.014),
                      ],
                    ),
                  ),
                  TitleText(text: 'New Password'),
                  SizedBox(height: SizeConfig.screenHeight * 0.010),
                  CustomTextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
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

                  TitleText(text: 'Confirm New Password'),
                  SizedBox(height: SizeConfig.screenHeight * 0.010),
                  CustomTextFormField(
                    controller: _confirmPasswordTEController,
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

                  SizedBox(height: SizeConfig.screenHeight * 0.032),
                  ElevatedButton(onPressed: () {}, child: Text('Submit')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
