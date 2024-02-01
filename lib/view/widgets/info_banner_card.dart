import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class InfoBannerCard extends StatelessWidget {
  const InfoBannerCard(
      {Key? key, required this.title, required this.subtitle, this.button})
      : super(key: key);

  final String title;
  final String subtitle;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: height * 0.21,
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: TobetoAppColor.colorSchemeLight.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: TobetoAppColor.textColorDark),
              ),
              if (button != null)
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 86,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          subtitle,
                          // '80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini   kazan.',
                          style: TextStyle(
                              color: TobetoAppColor.textColorDark,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Spacer(),
                    button!
                  ],
                )
              else
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: TobetoAppColor.textColorDark,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
            ]),
          ),
        ),
      ),
    );
  }
}
