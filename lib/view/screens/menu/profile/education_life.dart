import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/delete_confirmation_dialog.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';
import 'package:tobeto_app/view/widgets/exprience_card.dart';
import 'package:tobeto_app/view/widgets/save_cancel_button.dart';

class EducationLife extends StatelessWidget {
  const EducationLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Eğitim Hayatım ',
          actions: [
            IconButton(
                onPressed: () {
                  _showAddEducationLifeBottomSheet(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
          if (state is UserLoaded) {
            if (state.userEducations != null &&
                state.userEducations!.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.userEducations != null
                      ? state.userEducations!.length
                      : 0,
                  itemBuilder: (context, index) => ExperienceCard(
                      icon: Image.asset("assets/images/education_icon.png"),
                      title: Text(state.userEducations![index].schoolName),
                      subTitle: Text(state.userEducations![index].department),
                      startDate: Text(state.userEducations![index].startDate),
                      finishDate: Text(state.userEducations![index].endDate),
                      textButton: TextButton(
                          onPressed: () async {
                            bool? confirmDeletion =
                                await DeleteConfirmationDialog.show(
                                    context,
                                    'Deneyimi Sil',
                                    'Bu deneyimi silmek istediğinizden emin misiniz?');

                            if (confirmDeletion == true) {
                              context
                                  .read<UserBloc>()
                                  .add(DeleteEducation(index: index));
                            } else {
                              print('Silme iptal');
                            }
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
                      "Eğitim Bulunmamakta!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Eklenmiş herhangi eğitim yetkinlik bulunamadı",
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

void _showAddEducationLifeBottomSheet(
  BuildContext context,
) {
  final _formKey = GlobalKey<FormState>();

  String _schoolName = '';
  String _department = '';
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
                  'Eğitim Ekle',
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
                  labelText: 'Okul Adı ',
                  onSaved: (value) => _schoolName = value!,
                ),
                CustomTextField(
                  labelText: 'Bölümü',
                  onSaved: (value) => _department = value!,
                ),
                CustomTextField(
                  hintText: 'Yıl',
                  labelText: 'Başlangıç Tarihi',
                  onSaved: (value) => _startDate = value!,
                  keyboardType: TextInputType.datetime,
                ),
                CustomTextField(
                  hintText: 'Yıl',
                  labelText: 'Bitiş Tarihi',
                  onSaved: (value) => _endDate = value!,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_32,
                ),
                SaveCancelButton(onCancel: () {
                  Navigator.pop(context);
                }, onSave: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    EducationInfo educations = EducationInfo(
                        schoolName: _schoolName,
                        department: _department,
                        startDate: _startDate,
                        endDate: _endDate);

                    context
                        .read<UserBloc>()
                        .add(AddEducation(userEducations: educations));

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
