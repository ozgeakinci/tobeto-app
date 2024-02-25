import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class SaveCancelButton extends StatelessWidget {
  const SaveCancelButton(
      {Key? key, required this.onCancel, required this.onSave})
      : super(key: key);

  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: isDarkMode
                    ? BorderSide.none
                    : BorderSide(color: TobetoAppColor.textColor),
              ),
              elevation: 0,
              backgroundColor: isDarkMode
                  ? TobetoAppColor.inputDarkBackground
                  : TobetoAppColor.backgroundLight,
              foregroundColor: TobetoAppColor.selecetedItemColor,
              fixedSize: Size(160, 45),
            ),
            onPressed: onCancel,
            child: Text('Vazgeç'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(160, 45)),
            onPressed: onSave,
            child: Text('Kaydet'),
          ),
        ),
      ],
    );
  }
}
