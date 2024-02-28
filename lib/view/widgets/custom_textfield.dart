import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

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
  final String? Function(String?)? customValidator;
  final String? hintText;
  final String? helperText;
  final int? maxLength;

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
      this.height,
      this.customValidator,
      this.hintText,
      this.helperText,
      this.maxLength})
      : super(key: key);

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName boş olamaz';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ProjectUtilities.projectHeight_8,
            vertical: ProjectUtilities.sizeWidth_16),
        child: TextFormField(
          maxLength: maxLength,
          enabled: enabled,
          onSaved: onSaved,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: (value) {
            // Genel validasyon
            final generalValidation = _validateInput(value, labelText);
            if (generalValidation != null) {
              return generalValidation;
            }

            // Özel validasyon sadece telefon numarası alanı için
            if (customValidator != null) {
              final customValidation = customValidator!(value);
              if (customValidation != null) {
                return customValidation;
              }
            }

            return null;
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            helperText: helperText,
            hintText: hintText,
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
