import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
  });
  final String text;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyles.header.copyWith(fontSize: size, fontWeight: fontWeight),
    );
  }
}
