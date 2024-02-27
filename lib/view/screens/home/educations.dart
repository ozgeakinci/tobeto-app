// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_event.dart';
import 'package:tobeto_app/bloc/educations/educations_state.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/educational_card.dart';

class Educations extends StatelessWidget {
  const Educations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Eğitimlerim',
      ),
      body: BlocBuilder<DepartmentBloc, EducationsState>(
          builder: (context, state) {
        if (state is EducationsInitial) {
          context.read<DepartmentBloc>().add(
              FetchDepartmentRequested(department: userBloc.userDepartment!));
        }

        if (state is EducationsLoading) {}

        if (state is EducationsLoaded) {
          return ListView.builder(
              itemCount: state.educationDepartmenogInfo.length,
              itemBuilder: (context, index) => EducationalCard(
                  department: state.educationDepartmenogInfo[index]));
        } else {
          return const Center(child: Text("Yükleniyor....."));
        }
      }),
    );
  }
}
