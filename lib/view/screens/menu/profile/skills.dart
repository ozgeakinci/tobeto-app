import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';
import 'package:tobeto_app/view/widgets/skills_card.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Yetkinliklerim',
        actions: [
          IconButton(
              onPressed: () {
                _showAddSkillsBottomSheet(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          context.read<UserBloc>().add(FetchUserRequested());
          print(state);
        }
        if (state is UserLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoaded) {
          print(state.email);
          print(state.skills);

          return ListView.builder(
              itemCount: state.skills != null ? state.skills!.length : 0,
              itemBuilder: ((context, index) => SkillsCard(
                  title: Text(
                    state.skills![index],
                  ),
                  icon: Icon(Icons.work_outline_outlined,
                      color: ColorScheme.dark().secondary),
                  textButton: TextButton(
                      onPressed: () {
                        print("Yetkinliklerim silme butonu click");
                      },
                      child: Image.asset('assets/images/delete_icon.png')))));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

class DeleteButton {
  static TextButton deleteIconButton = TextButton(
      onPressed: () {}, child: Image.asset("assets/images/delete_icon.png"));
}

void _showAddSkillsBottomSheet(
  BuildContext context,
) {
  final _formKey = GlobalKey<FormState>();
  List<String> skills = [];

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
                  'Yetkinlik Ekle',
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
                /*  CustomTextField(
                  labelText: 'Yetkinlik',
                ), */
                CustomTextField(
                  labelText: 'Yetenek ekle',
                  onSaved: (value) => skills = value!.split(','),
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

                          context
                              .read<UserBloc>()
                              .add(AddSkills(addedSkills: skills));

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
