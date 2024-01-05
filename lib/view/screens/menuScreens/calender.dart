import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/announccementAndnewsWidgets/notification_card.dart';

class Calender extends StatelessWidget {
  Calender({Key? key}) : super(key: key);

  final List<String> teachers = [
    "Halit Enes Kalaycı",
    "Engin Demiroğ",
    "İrem Balcı",
    "Gürkan İlişen"
  ];

  final String selectedTeacher = "Halit Enes Kalaycı";

  void calenderAddIcon(BuildContext context) {
    print("Calender sayfasındaki ikon tıklandı");
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filtre',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton(
                    isExpanded: true,
                    hint: const Text("Kategori Seç"),
                    value: selectedTeacher,
                    items: teachers.map((teacher) {
                      return DropdownMenuItem(
                        value: teacher,
                        child: Text(teacher),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      /*   setState(() {
                        selectedmenu = newValue;
                      }); */
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Eğitim Durumu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  buildFilterRow("Bitmiş Dersler", true),
                  buildFilterRow("Devam eden dersler", false),
                  buildFilterRow("Satın alınmış dersler", true),
                  buildFilterRow("Başlamamış dersler", false),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Vazgeç',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print("Kaydet button tıklanı");
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Oval şeklinde kenarlar
                            ),
                          ),
                          child: const Text('Kaydet'),
                        ),
                      ),
                    ],
                  )
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

Widget buildFilterRow(String labelText, bool initialValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(labelText),
      Checkbox(
        value: initialValue,
        onChanged: (newValue) {
          // Checkbox'ın durumu değiştiğinde yapılacak işlemler
          /*   setState(() {
                  checkboxValue = newValue!;
                }); */
        },
      ),
    ],
  );
}
