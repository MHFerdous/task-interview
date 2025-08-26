import 'package:flutter/material.dart';
import 'package:interview/app/styling/text_styles.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.textInputAction,
    required this.hintText,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    required this.textInputType,
    required this.isPasswordField,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      initialValue: widget.controller.text,
      builder: (FormFieldState<String> fieldState) {
        return TextFormField(
          style: TextStyles.title,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isPasswordField ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: fieldState.errorText,
            suffixIcon: widget.isPasswordField
                ? IconButton(
              icon: PhosphorIcon(
                _obscureText
                    ? PhosphorIconsDuotone.eyeClosed
                    : PhosphorIconsDuotone.eye,
                color: AppColors.titleColors,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
          onChanged: (value) {
            fieldState.didChange(value);
          },
        );
      },
    );
  }
}