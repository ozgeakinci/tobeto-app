import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/announccementAndnewsWidgets/notification_card.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  void calenderAddIcon(BuildContext context) {
    print("Calender sayfasındaki ikon tıklandı");
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Egitmen seçiniz'),
                  Icon(Icons.chevron_right),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Eğitim Durumu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bitmiş Dersler'),
                  Icon(Icons.check_box),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Devam eden dersler'),
                  Icon(Icons.check_box),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Satın alınmış dersler'),
                  Icon(Icons.check_box),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Başlanmamış dersler'),
                  Icon(Icons.check_box),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Alt sayfayı kapat
                      },
                      child: Text('Vazgeç'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Kaydetme işlemleri
                      },
                      child: Text('Kaydet'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: const [
            NatificationCard(
              title: "C#Programming",
              subtitle: "Gürkan ilişen",
              date: "15 Ara 2023 18:00",
              finishDate: "15 Ara 2023 20:00",
              image: "assets/images/message_icon.png",
              subImage: "assets/images/time_icon.png",
            ),
            SizedBox(
              height: 12,
            ),
            NatificationCard(
              title: "C#Programming",
              subtitle: "Gürkan ilişen",
              date: "15 Ara 2023 18:00",
              finishDate: "15 Ara 2023 20:00",
              image: "assets/images/message_icon.png",
              subImage: "assets/images/time_icon.png",
            )
          ],
        ),
      ),
    );
  }
}
