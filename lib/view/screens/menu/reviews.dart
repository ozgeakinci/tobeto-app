import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/exam_status_card.dart';
import 'package:tobeto_app/view/widgets/info_banner_card.dart';
import 'package:tobeto_app/view/widgets/info_talent_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: const Text(
            'Değerlendirmeler',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF6A00FF),
                Color(0xFF9013FE),
                Color(0xFFC100FF),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 37, top: 14, bottom: 14),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Yetkinlik',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TobetoAppColor.primaryBackgroundColor,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: 'lerini ücretsiz ölç,           ',
                      style: Theme.of(context).textTheme.titleLarge),
                  TextSpan(
                      text: 'bilgi',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TobetoAppColor.primaryBackgroundColor,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: 'lerini test et.',
                      style: Theme.of(context).textTheme.titleLarge),
                ]),
              ),
            ),
            InfoBannerCard(
                button: FilledButton(
                    onPressed: () {},
                    child: const Text(
                      'Raporu Görüntüle',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                title: 'Tobeto İşte Başarı Modeli',
                subtitle:
                    '80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini   kazan.'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 37, top: 14, bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yazılımda Başarı Testi',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Çoktan seçmeli sorular ile teknik bilgini test et.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const ExamStatusCard(point: "84.00", section: 'Front End'),
            ExamStatusCard(
              point: "--",
              section: 'Full Stack',
              icon: TextButton(
                onPressed: () {},
                child: Text('Başla',
                    style: TextStyle(
                      color: TobetoAppColor.primaryBackgroundColor,
                    )),
              ),
            ),
            ExamStatusCard(
              point: '--',
              section: 'Back End',
              icon: TextButton(
                onPressed: () {},
                child: Text('Başla',
                    style: TextStyle(
                        color: TobetoAppColor.primaryBackgroundColor,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            const ExamStatusCard(
                point: '76.00', section: 'Microsoft SQL Server'),
            ExamStatusCard(
              point: '--',
              section: 'Masaüstü Programlama',
              icon: TextButton(
                onPressed: () {},
                child: Text('Başla',
                    style: TextStyle(
                        color: TobetoAppColor.primaryBackgroundColor,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 37, top: 14, bottom: 14),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Aboneliğe özel ',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TobetoAppColor.primaryBackgroundColor,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: 'değerlendirme araçları için',
                      style: Theme.of(context).textTheme.titleLarge),
                ]),
              ),
            ),
            const InfoBannerCard(
                title: 'Kazanım Odaklı Test',
                subtitle:
                    'Dijital gelişim kategorisindeki eğitimlere başlamadan öncekonuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.'),
            InfoTalentCard(
              title: 'Huawei Talent InterviewTeknik Bilgi\nSınavı',
              subtitle:
                  "Sertifika alabilmen için, eğitim yolculuğunun \nsonunda teknik yetkinliklerin ve kod bilgin\nölçülür. \n\n4400+ soru | 30+ programlama dili4 zorluk seviyesi\n*Türkiye Ar-Ge Merkezi tarafından\ntasarlanmıştır",
              image: Image.asset("assets/images/hello_tobeto.png"),
            )
          ],
        ));
  }
}
