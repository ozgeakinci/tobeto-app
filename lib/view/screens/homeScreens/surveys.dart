import 'package:flutter/material.dart';

class Surveys extends StatelessWidget {
  const Surveys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anketlerim",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B4FFD),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/anket_image.png',
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Anket Bulunmamakta"),
            const Text("Atanmış herhangi bir anket bulunamadı "),
          ],
        ),
      ),
    );
  }
}
