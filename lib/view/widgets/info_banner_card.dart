import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class InfoBannerCard extends StatelessWidget {
  const InfoBannerCard(
      {Key? key, this.title, required this.subtitle, this.button, this.color})
      : super(key: key);

  final String? title;
  final String subtitle;
  final Widget? button;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = color ?? TobetoAppColor.selecetedItemColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 180,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (title != null && title!.isNotEmpty)
                Text(
                  title!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? TobetoAppColor.backgroundDark
                          : TobetoAppColor.backgroundLight),
                ),
              if (button != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                            fontSize: 14,
                            color: isDarkMode
                                ? TobetoAppColor.backgroundDark
                                : TobetoAppColor.backgroundLight),
                      ),
                    ),
                    Expanded(flex: 2, child: button!)
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
                          color: isDarkMode
                              ? TobetoAppColor.backgroundDark
                              : TobetoAppColor.backgroundLight,
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
