import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';

import 'package:tobeto_app/view/widgets/educational_card.dart';

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
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is GetUserInfo) {
            print("nsbdjhsdjhsdk  $state");

            context
                .read<AuthBloc>()
                .add(GetDepartment(department: state.department));
          }

          if (state is GetDepartmentInfo) {
            return ListView(
              children: [
                EducationalCard(
                    title: state.educationDepartmentInfo,
                    subTitle: "21 Eylül 2023 15:20"),
                const EducationalCard(
                    title: "Dr. Ecmal Ayral'dan Hoşgeldin Mesajı",
                    subTitle: "21 Eylül 2023 15:20"),
              ],
            );
          } else {
            return const Center(child: Text("Unknown State"));
          }
        }));
  }
}
