import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class DeleteConfirmationDialog {
  static Future<bool?> show(
    BuildContext context,
    String title,
    String content,
  ) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Sil',
                style: TextStyle(color: TobetoAppColor.colorSchemeLight.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
