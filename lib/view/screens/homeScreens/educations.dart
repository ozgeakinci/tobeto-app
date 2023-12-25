import 'package:flutter/material.dart';

class Educations extends StatelessWidget {
  const Educations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eğitimlerim",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B4FFD),
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
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Dr. Ecmal Ayral'dan Hoşgeldin Mesajı"),
                  const Text("21 Eylül 2023 15:20"),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/hello_tobeto.png',
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("EĞİTİME GİT"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Dr. Ecmal Ayral'dan Hoşgeldin Mesajı"),
                  const Text("21 Eylül 2023 15:20"),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/hello_tobeto.png',
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("EĞİTİME GİT"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
