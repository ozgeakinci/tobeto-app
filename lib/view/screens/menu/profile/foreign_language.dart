import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/menu/profile/skills.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';
import 'package:tobeto_app/view/widgets/skills_card.dart';

class ForeignLanguage extends StatelessWidget {
  const ForeignLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Yabancı Dillerim',
        actions: [
          IconButton(
              onPressed: () {
                _showAddLanguagesBottomSheet(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(children: [
        SkillsCard(
            icon: Image.asset("assets/images/world_icon.png"),
            title: const Text('İngilizce'),
            subTitle: const Text("Orta Seviye (B1, B2)"),
            textButton: DeleteButton.deleteIconButton),
      ]),
    );
  }
}

void _showAddLanguagesBottomSheet(
  BuildContext context,
) {
  final _formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    elevation: 0,
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (context, scrollController) =>
          ListView(shrinkWrap: true, controller: ScrollController(), children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              right: 16,
              left: 16,
              top: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Yabancı Dil Ekle',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_8,
                ),
                Divider(),
                SizedBox(
                  height: ProjectUtilities.projectHeight_16,
                ),
                CustomTextField(
                  labelText: 'Dil',
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_16,
                ),
                CustomTextField(
                  labelText: 'Seviye',
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // İstediğiniz border radius'u belirleyebilirsiniz.
                              side: BorderSide(
                                  color: TobetoAppColor
                                      .textColor), // Border'ı belirleyebilirsiniz.
                            ),
                            elevation: 0,
                            backgroundColor: TobetoAppColor.buttonColorLight,
                            foregroundColor:
                                TobetoAppColor.primaryBackgroundColor,
                            fixedSize: Size(175, 45)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Vazgeç')),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(175, 45)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          Navigator.pop(context);
                        }
                      },
                      child: Text('Kaydet'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    ),
  );
}
