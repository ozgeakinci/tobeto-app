import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/big_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? TobetoAppColor.backgroundDark
          : TobetoAppColor.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 15,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hoşgeldin Özge, Hasan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        color: TobetoAppColor.colorSchemeLight.secondary,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 32, top: 16, right: 20),
                          child: Text(
                            'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al. Aradığın “İş” Burada!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: Image.asset(
                          'assets/images/hello_tobeto.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Bilgilendirmeler Bölümü
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bilgilendirmeler',
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          BigButton(
                              title: 'Başvurularım',
                              color: isDarkMode
                                  ? TobetoAppColor.buttonColorDark
                                  : TobetoAppColor.buttonColorLight,
                              textColor: isDarkMode
                                  ? TobetoAppColor.textColorDark
                                  : TobetoAppColor.textColorBlack),
                          const SizedBox(
                            width: 10,
                          ),
                          BigButton(
                              title: 'Eğitimlerim',
                              color: isDarkMode
                                  ? TobetoAppColor.buttonColorDark
                                  : TobetoAppColor.buttonColorLight,
                              textColor: isDarkMode
                                  ? TobetoAppColor.textColorDark
                                  : TobetoAppColor.textColorBlack)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        BigButton(
                            title: 'Duyuru ve Haberler',
                            color: isDarkMode
                                ? TobetoAppColor.buttonColorDark
                                : TobetoAppColor.buttonColorLight,
                            textColor: isDarkMode
                                ? TobetoAppColor.textColorDark
                                : TobetoAppColor.textColorBlack),
                        const SizedBox(
                          width: 10,
                        ),
                        BigButton(
                            title: 'Anketlerim',
                            color: isDarkMode
                                ? TobetoAppColor.buttonColorDark
                                : TobetoAppColor.buttonColorLight,
                            textColor: isDarkMode
                                ? TobetoAppColor.textColorDark
                                : TobetoAppColor.textColorBlack)
                      ],
                    )
                  ]),
            ),

            //Gelişim Bölümü
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gelişim',
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          BigButton(
                            title: 'Sınavlarım',
                            color: const Color(0xffEC7B9C),
                            textColor: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          BigButton(
                            title: 'Profil Oluştur',
                            color: const Color(0xff7086FF),
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        BigButton(
                          title: 'Kendini Değerlendir',
                          color: const Color(0xff62CBA2),
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BigButton(
                          title: 'Öğrenmeye başla',
                          color: const Color(0xffB266FF),
                          textColor: Colors.white,
                        )
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
