import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';

class SubHeaderText extends StatelessWidget {
  const SubHeaderText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyles.subHeader,
    );
  }
}
