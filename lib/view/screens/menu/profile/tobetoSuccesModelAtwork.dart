import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

class TobetoSuccesModelAtwork extends StatelessWidget {
  const TobetoSuccesModelAtwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppbar(
        title: "Tobeto İşte Başarı Modelim",
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDarkMode
                        ? TobetoAppColor.backgroundDark
                        : TobetoAppColor.backgroundLight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'assets/images/spider.jpeg',
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      succesItem("4.5", "Yeni dünyaya hazırlanıyorum",
                          TobetoAppColor.greyColor),
                      const SizedBox(height: 10),
                      succesItem("5", "Profesyonel duruşumu geliştiriyorum",
                          TobetoAppColor.greenColor),
                      const SizedBox(height: 10),
                      succesItem("4.4", "Kendimi tanıyor ve yönetiyorum",
                          TobetoAppColor.yellowColor),
                      const SizedBox(height: 10),
                      succesItem(
                          "4.8",
                          "Yaratıcı ve doğru çözümler geliştiriyorum",
                          TobetoAppColor.selecetedItemColor),
                      const SizedBox(height: 10),
                      succesItem("5", "Kendimi sürekli geliştiriyorum",
                          TobetoAppColor.pinkColor),
                      const SizedBox(height: 10),
                      succesItem("3.8", "Başkaları ile birlikte çalışıyorum",
                          TobetoAppColor.orchisColor),
                      const SizedBox(height: 10),
                      succesItem("4.6", "Sonuç ve başarı odaklıyım",
                          TobetoAppColor.lightPinkColor),
                      const SizedBox(height: 10),
                      succesItem("4.9", "Anlıyorum ve anlaşılıyorum",
                          TobetoAppColor.darkYellowColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget succesItem(String leftText, String rightText, Color backgroundColor) {
    return Row(
      children: [
        Container(
          width: 50,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            leftText,
            style: TextStyle(color: TobetoAppColor.backgroundLight),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 16),
        Text(
          rightText,
          style: TextStyle(),
        ),
      ],
    );
  }
}
