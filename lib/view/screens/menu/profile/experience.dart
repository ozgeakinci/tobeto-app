import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Deneyimlerim',
        actions: [
          IconButton(
              onPressed: () {
                _showAddExperienceBottomSheet(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNoExperienceWidget(),
          ],
        ),
      ),
    );
  }
}

Widget _buildNoExperienceWidget() {
  return Column(
    children: [
      Image.asset('assets/images/survey_image.png'),
      const SizedBox(height: 20),
      Text(
        "Deneyim Bulunmamakta!",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 3),
      Text("Eklenmiş deneyim bulunamadı"),
    ],
  );
}

Widget _buildErrorWidget(String error) {
  return Center(
    child: Text(
      'Hata: $error',
      style: TextStyle(color: TobetoAppColor.textColorDark),
    ),
  );
}

void _showAddExperienceBottomSheet(
  BuildContext context,
) {
  final _formKey = GlobalKey<FormState>();
  String _experienceName = '';
  String _experienceDate = '';
  String _experienceExplain = '';
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'Deneyim Adı',
                onSaved: (value) => _experienceName = value!,
              ),
              CustomTextField(
                labelText: 'Deneyim Tarihi',
                onSaved: (value) => _experienceDate = value!,
              ),
              CustomTextField(
                labelText: 'Deneyimin Açıklaması',
                onSaved: (value) => _experienceExplain = value!,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(_experienceDate);
                    print(_experienceExplain);
                    print(_experienceName);
                    ExperienceInfo experienceInfo = ExperienceInfo(
                      experienceName: _experienceName,
                      experienceDate: _experienceDate,
                      experienceExplain: _experienceExplain,
                    );

                    context.read<UserBloc>().add(
                          AddExperience(
                            experienceDetail: experienceInfo,
                          ),
                        );

                    Navigator.pop(context); // Bottom sheet'i kapat
                  }
                },
                child: Text('Deneyim Ekle'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
