import 'package:flutter/material.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.024),

                CustomHeaderText(text: 'What is Your Mother Language'),
                SizedBox(height: SizeConfig.screenHeight * 0.010),
                CustomSubHeaderText(
                  text:
                      'Discover what is a podcast description and podcast summary.',
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.024),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
