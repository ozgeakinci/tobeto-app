import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/view/screens/auth_page.dart';
import 'package:tobeto_app/view/widgets/bottom_navbar.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    print("StartPage");

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      print("StartPage AuthBloc");

      if (state is Authenticated) {
        print("StartPage AuthBloc Authenticated");

        context.read<UserBloc>().add(FetchUserRequested());
        context.read<NavigationBloc>().add(NavigationEvent.Anasayfa);

        return BottomNavbar();
      }

      return AuthPage();
    });
  }
}
