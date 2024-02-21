import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
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
  String _organizationName = '';
  String _position = '';
  String _startDate = '';
  String _endDate = '';

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.92,
            maxChildSize: 1,
            minChildSize: 0.6,
            builder: (context, scrollController) => ListView(
                shrinkWrap: true,
                controller: ScrollController(),
                children: [
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
                            'Deneyim Ekle',
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
                            labelText: 'Kurum Adı',
                            onSaved: (value) => _organizationName = value!,
                          ),
                          SizedBox(
                            height: ProjectUtilities.projectHeight_16,
                          ),
                          CustomTextField(
                            labelText: 'Pozisyon',
                            onSaved: (value) => _position = value!,
                          ),
                          SizedBox(
                            height: ProjectUtilities.projectHeight_16,
                          ),
                          CustomTextField(
                            labelText: 'İşe Giriş Tarihiı',
                            onSaved: (value) => _startDate = value!,
                          ),
                          SizedBox(
                            height: ProjectUtilities.projectHeight_16,
                          ),
                          CustomTextField(
                            labelText: 'İşten Çıkış Tarihi',
                            onSaved: (value) => _endDate = value!,
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
                                      backgroundColor:
                                          TobetoAppColor.buttonColorLight,
                                      foregroundColor:
                                          TobetoAppColor.primaryBackgroundColor,
                                      fixedSize: Size(175, 45)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Vazgeç')),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(175, 45)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print(_organizationName);
                                    print(_position);
                                    print(_startDate);
                                    print(_endDate);

                                    ExperienceInfo experienceInfo =
                                        ExperienceInfo(
                                      organizationName: _organizationName,
                                      position: _position,
                                      startDate: _startDate,
                                      endDate: _endDate,
                                    );

                                    context.read<UserBloc>().add(
                                          AddExperience(
                                            experienceDetail: experienceInfo,
                                          ),
                                        );

                                    Navigator.pop(
                                        context); // Bottom sheet'i kapat
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
          ));
}
