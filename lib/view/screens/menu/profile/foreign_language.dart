import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/language_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';
import 'package:tobeto_app/view/widgets/save_cancel_button.dart';
import 'package:tobeto_app/view/widgets/skill_card.dart';

class ForeignLanguage extends StatelessWidget {
  const ForeignLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
        body: BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
          if (state is UserLoaded) {
            if (state.languages != null && state.languages!.isNotEmpty) {
              return ListView.builder(
                  itemCount:
                      state.languages != null ? state.languages!.length : 0,
                  itemBuilder: (context, index) => SkillCard(
                      icon: Image.asset("assets/images/world_icon.png"),
                      title: Text(state.languages![index].language),
                      subTitle: Text(state.languages![index].level),
                      textButton: TextButton(
                          onPressed: () {
                            context
                                .read<UserBloc>()
                                .add(DeleteLanguage(index: index));
                          },
                          child:
                              Image.asset('assets/images/delete_icon.png'))));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/survey_image.png',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Yabancı dil Bulunmamakta!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Eklenmiş herhangi bir dil bulunamadı",
                      style: TextStyle(
                          color: isDarkMode
                              ? TobetoAppColor.textColorDark
                              : TobetoAppColor.colorSchemeLight.primary),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })));
  }
}

void _showAddLanguagesBottomSheet(
  BuildContext context,
) {
  final _formKey = GlobalKey<FormState>();

  String _languageName = '';
  String _languageLevel = '';

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
                CustomTextField(
                  labelText: 'Dil',
                  onSaved: (value) => _languageName = value!,
                ),
                CustomTextField(
                  labelText: 'Seviye',
                  onSaved: (value) => _languageLevel = value!,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_32,
                ),
                SaveCancelButton(onCancel: () {
                  Navigator.pop(context);
                }, onSave: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    LanguageModel language = LanguageModel(
                      language: _languageName,
                      level: _languageLevel,
                    );

                    context
                        .read<UserBloc>()
                        .add(AddLanguage(language: language));

                    Navigator.pop(context);
                  }
                }),
              ],
            ),
          ),
        ),
      ]),
    ),
  );
}
