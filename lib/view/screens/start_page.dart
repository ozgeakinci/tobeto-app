import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/bloc/department/department_state.dart';
import 'package:tobeto_app/view/screens/auth_page.dart';
import 'package:tobeto_app/view/swiper_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated ||
          state is GetUserInfo ||
          state is DepartmentLoaded) {
        return const SwiperPage();
      }

      return AuthPage();
    });
  }
}
