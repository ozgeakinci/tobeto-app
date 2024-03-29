import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_bloc.dart';
import 'package:tobeto_app/bloc/calendar/calendar_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/firebase_options.dart';
import 'package:tobeto_app/theme/tobeto_theme.dart';
import 'package:tobeto_app/view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<EducationsBloc>(create: (context) => EducationsBloc()),
        BlocProvider<CatalogBloc>(create: (context) => CatalogBloc()),
        BlocProvider<NotificationBloc>(create: (context) => NotificationBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<CalendarBloc>(create: (context) => CalendarBloc()),
      ],
      child: MaterialApp(
        theme: TobetoAppTheme.lightTheme(),
        darkTheme: TobetoAppTheme.darkTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
