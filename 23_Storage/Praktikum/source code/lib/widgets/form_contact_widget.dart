import 'package:flutter/material.dart';

class FormContactWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const FormContactWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16),
          fillColor: const Color(0xFFE7E0EC),
          filled: true,
        ),
      ),
    );
  }
}
