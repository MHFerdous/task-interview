import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview/app/styling/size_config.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
  });
  final double width, height;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          height: SizeConfig.screenHeight * height,
          width: SizeConfig.screenWidth * width,
          fit: BoxFit.contain,
          icon,
        ),
      ),
    );
  }
}
