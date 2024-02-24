import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

class TobetoSuccesModelAtwork extends StatelessWidget {
  const TobetoSuccesModelAtwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    width: 2,
                    color: Color.fromARGB(255, 226, 223, 223),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'assets/images/spiderman.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      succesItem(
                          "4.5", "Yeni dünyaya hazırlanıyorum", Colors.grey),
                      const SizedBox(height: 10),
                      succesItem("5", "Profesyonel duruşumu geliştiriyorum",
                          Colors.green),
                      const SizedBox(height: 10),
                      succesItem("4.4", "Kendimi tanıyor ve yönetiyorum",
                          Colors.yellow),
                      const SizedBox(height: 10),
                      succesItem(
                          "4.8",
                          "Yaratıcı ve doğru çözümler geliştiriyorum",
                          Colors.brown),
                      const SizedBox(height: 10),
                      succesItem(
                          "5", "Kendimi sürekli geliştiriyorum", Colors.pink),
                      const SizedBox(height: 10),
                      succesItem("3.8", "Başkaları ile birlikte çalışıyorum",
                          Colors.orange),
                      const SizedBox(height: 10),
                      succesItem(
                          "4.6", "Sonuç ve başarı odaklıyım", Colors.purple),
                      const SizedBox(height: 10),
                      succesItem(
                          "4.9", "Anlıyorum ve anlaşılıyorum", Colors.blue),
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
            style: TextStyle(),
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
