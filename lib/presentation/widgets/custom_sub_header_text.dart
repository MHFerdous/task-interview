import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';

class CustomSubHeaderText extends StatelessWidget {
  const CustomSubHeaderText({super.key, required this.text, this.textAlign});

  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign, style: TextStyles.subHeader);
  }
}
