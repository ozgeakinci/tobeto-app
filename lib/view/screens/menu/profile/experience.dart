import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/expreince_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';
import 'package:tobeto_app/view/widgets/exprience_card.dart';
import 'package:tobeto_app/view/widgets/save_cancel_button.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          context.read<UserBloc>().add(ResetUserEvent());
        }
        if (state is UserLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoaded) {
          return ListView.builder(
            itemCount:
                state.experiences != null ? state.experiences!.length : 0,
            itemBuilder: ((context, index) => ExperienceCard(
                icon: Icon(Icons.work_outline_outlined,
                    color: ColorScheme.dark().secondary),
                title: Text(state.experiences![index].organizationName),
                subTitle: Text(state.experiences![index].position),
                startDate: Text(state.experiences![index].startDate),
                finishDate: Text(state.experiences![index].endDate),
                textButton: TextButton(
                    onPressed: () {
                      context
                          .read<UserBloc>()
                          .add(DeleteExperience(index: index));
                    },
                    child: Image.asset('assets/images/delete_icon.png')))),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
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
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                  hintText: 'Gün/Ay/Yıl',
                  onSaved: (value) => _startDate = value!,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_16,
                ),
                CustomTextField(
                  labelText: 'İşten Çıkış Tarihi',
                  hintText: 'Gün/Ay/Yıl',
                  onSaved: (value) => _endDate = value!,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_64,
                ),
                SaveCancelButton(onCancel: () {
                  Navigator.pop(context);
                }, onSave: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    ExperienceInfo experienceInfo = ExperienceInfo(
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

                    Navigator.pop(context);
                  }
                })
              ],
            ),
          ),
        ),
      ]),
    ),
  );
}
