import 'package:flutter/material.dart';

import 'package:tobeto_app/view/widgets/educations_list_item.dart';

class Educations extends StatelessWidget {
  const Educations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eğitimlerim",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            EducationsListItem(),
          ],
        ),
      ),
    );
  }
}
