import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/widgets/custom_text_button.dart';
import 'package:interview/presentation/widgets/header_text.dart';
import 'package:interview/presentation/widgets/subHeader_text.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _otpTEController = TextEditingController();

  bool _isLoading = false;

  late Timer _timer;
  int _start = 60;
  bool _isButtonDisabled = true;

  void _startTimer() {
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isButtonDisabled = false;
        });
      } else {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

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
                        HeaderText(text: 'Verify Code'),
                        SizedBox(height: SizeConfig.screenHeight * 0.008),
                        SubHeaderText(
                          text:
                              'Please enter the code we just sent to email pristia@gmail.com',
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.044),

                        _start == 0
                            ? SubHeaderText(text: 'Resend Code in: $_start')
                            : CustomTextButton(
                              text: 'Resend Code',
                              onPressed: () {},
                            ),
                      ],
                    ),
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
