import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/announccementAndnewsWidgets/notification_card.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
