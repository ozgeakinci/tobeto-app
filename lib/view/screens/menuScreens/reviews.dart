import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Yetkinlik',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: ThemeData.light().primaryColor)),
            TextSpan(
                text: 'lerini ücretsiz ölç,',
                style: TextStyle(color: TobetoAppColor.textColorBlack)),
            const TextSpan(text: 'bilgi'),
            const TextSpan(text: 'lerini test et.'),
          ]),
        )
      ],
    ));
  }
}
