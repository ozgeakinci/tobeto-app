import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/department/department_bloc.dart';
import 'package:tobeto_app/bloc/department/department_event.dart';
import 'package:tobeto_app/bloc/department/department_state.dart';

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
        body: BlocBuilder<DepartmentBloc, DepartmentState>(
            builder: (context, state) {
          print("Departmenetttadadasd---  $state");
          if (state is DepartmentInitial) {
            print("Departmenettt  $state");

            context
                .read<DepartmentBloc>()
                .add(GetDepartment(department: "collective"));
          }

          if (state is DepartmentLoading) {
            print("Departmenettt  $state");

            /*     */
          }

          if (state is DepartmentLoaded) {
            print(state.educationDepartmenogInfo.length);
            return ListView.builder(
                itemCount: state.educationDepartmenogInfo.length,
                itemBuilder: (context, index) => EducationalCard(
                    department: state.educationDepartmenogInfo[index]));
          } else {
            return const Center(child: Text("Unknown State"));
          }
        }));
  }
}
