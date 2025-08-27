import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyles.title);
  }
}
