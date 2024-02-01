import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String?)? onSaved;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.099,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextFormField(
          onSaved: onSaved,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: isDarkMode
                ? TobetoAppColor.inputDarkBackground
                : TobetoAppColor.backgroundLight,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: isDarkMode ? BorderSide.none : BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            prefixIcon: Icon(prefixIcon),
          ),
        ),
      ),
    );
  }
}
