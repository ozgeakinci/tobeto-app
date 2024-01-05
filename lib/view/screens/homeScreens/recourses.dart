import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class Recourses extends StatelessWidget {
  const Recourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Başvurularım",
          style: TextStyle(color: TobetoAppColor.textColorDark),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: isDarkMode
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3),
                  ],
                  color: isDarkMode
                      ? TobetoAppColor.buttonColorDark
                      : TobetoAppColor.buttonColorLight),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İstanbul Kodluyor Bilgilendirme",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Kabul Edildi",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: TobetoAppColor.colorSchemeLight.secondary,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: 20,
                          color: TobetoAppColor.colorSchemeLight.secondary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "İstanbul Kodluyor Başvuru Formu Onaylandı.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: 20,
                          color: TobetoAppColor.colorSchemeLight.secondary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "İstanbul Kodluyor Belge Yükleme Formu Onaylandı.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
