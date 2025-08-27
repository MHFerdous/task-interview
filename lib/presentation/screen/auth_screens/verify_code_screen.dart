import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/controllers/password_recovery_controller.dart';
import 'package:interview/presentation/controllers/restart_timer_controller.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/widgets/custom_text_button.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _restartTimerController = Get.put(RestartTimerController());
  final _checkOtpController = Get.put(PasswordRecoveryController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restartTimerController.startTimer(120);
    });
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
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.012),
                        CustomHeaderText(text: 'Verify Code'),
                        SizedBox(height: SizeConfig.screenHeight * 0.008),
                        CustomSubHeaderText(
                          text:
                              'Please enter the code we just sent to email ${widget.email}',
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.044),

                        PinCodeTextField(
                          controller: _otpTEController,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 45,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            activeColor: AppColors.headerColor,
                            inactiveColor: Colors.grey,
                            selectedColor: AppColors.headerColor,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onCompleted: (v) {},
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            return true;
                          },
                          appContext: context,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter pin code';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: SizeConfig.screenHeight * 0.144),

                        Obx(() {
                          return _restartTimerController.isButtonEnabled.value
                              ? CustomTextButton(
                                onPressed: () {
                                  _restartTimerController.startTimer(120);
                                },
                                text: 'Resend Code',
                              )
                              : Text(
                                'Resend Code in: ${_restartTimerController.remaining.value}s',
                                style: TextStyle(fontSize: 16),
                              );
                        }),

                        SizedBox(height: SizeConfig.screenHeight * 0.244),
                        Obx(
                          () => ElevatedButton(
                            onPressed:
                                _checkOtpController.isLoading.value
                                    ? null
                                    : () async {
                                      if (_formKey.currentState!.validate()) {
                                        _checkOtpController.verifyCode(
                                          widget.email,
                                          _otpTEController,
                                        );
                                      }
                                    },
                            child: Text('Continue'),
                          ),
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
