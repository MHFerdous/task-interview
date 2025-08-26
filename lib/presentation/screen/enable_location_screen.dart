import 'package:flutter/material.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/utility/image_assets.dart';
import 'package:interview/presentation/widgets/custom_text_button.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_image.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
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
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.218),
                      CustomImage(
                        width: 0.0120,
                        height: 0.0120,
                        icon: ImageAssets.mapIconSVG,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.028),
                      CustomHeaderText(text: 'Enable Location'),
                      SizedBox(height: SizeConfig.screenHeight * 0.012),
                      CustomSubHeaderText(
                        text:
                            'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                      ),

                      SizedBox(height: SizeConfig.screenHeight * 0.024),
                      ElevatedButton(onPressed: () {}, child: Text('Enable')),
                      SizedBox(height: SizeConfig.screenHeight * 0.024),
                      CustomTextButton(text: 'Skip, Not Now', onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
