import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        context.read<UserBloc>().add(FetchUserRequested());
        return const BottomNavbar();
      }

/*       if (state is Authenticated || state is GetUserInfo) {
        print('$state  tüm state');
        return const SwiperPage();
      } */

      return AuthPage();
    });
  }
}
