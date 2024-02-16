import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool? enabled;
  final int? maxLines;
  final double? height;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.prefixIcon,
      this.obscureText = false,
      this.enabled,
      this.controller,
      this.keyboardType,
      this.initialValue,
      this.onSaved,
      this.maxLines,
      this.height})
      : super(key: key);

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName boş olamaz';
    }

    return null; // Geçerli durumu temsil eder
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextFormField(
          enabled: enabled,
          onSaved: onSaved,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: (value) => _validateInput(value, labelText),
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: isDarkMode
                ? TobetoAppColor.inputDarkBackground
                : TobetoAppColor.backgroundLight,
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
