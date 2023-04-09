import 'package:flutter/material.dart';

class TextFieldCostume extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isValidTextField;
  final String errorMessage;
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIconWidget;
  const TextFieldCostume({
    super.key,
    required this.onChanged,
    required this.isValidTextField,
    required this.errorMessage,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      obscureText: isObscureText,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          errorText: isValidTextField ? null : errorMessage,
          suffixIcon: suffixIconWidget),
    );
  }
}
