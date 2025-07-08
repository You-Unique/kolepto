import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final Widget? suffixWidget;
  final bool obscure;
  final Widget? prefixWidget;
  final Color? hintcolor;
  final Color? labelcolor;
  final Color? bordercolor;

  const InputField({
    super.key,
    required this.textEditingController,
    this.label,
    this.prefixWidget,
    this.suffixWidget,
    this.hint,
    this.obscure = false,
    this.hintcolor,
    this.labelcolor,
    this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: labelcolor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: hintcolor,
        ),
        filled: true,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        fillColor: const Color.fromRGBO(249, 250, 251, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
