import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_bloc.dart';
import 'package:tobeto_app/bloc/department/department_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_bloc.dart';
import 'package:tobeto_app/firebase_options.dart';
import 'package:tobeto_app/theme/tobeto_theme.dart';
import 'package:tobeto_app/view/screens/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<DepartmentBloc>(create: (context) => DepartmentBloc()),
        BlocProvider<CatalogBloc>(create: (context) => CatalogBloc()),
        BlocProvider<NotificationBloc>(create: (context) => NotificationBloc())
      ],
      child: MaterialApp(
        theme: TobetoAppTheme.lightTheme(),
        darkTheme: TobetoAppTheme.darkTheme(),
        debugShowCheckedModeBanner: false,
        home: const StartPage(),
      ),
    ),
  );
}
