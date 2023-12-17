import 'package:flutter/material.dart';
import 'package:tobeto_app/menu/menu_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const MenuScreen(),
        body: const Center(
          child: Text('Ana Sayfa'),
        ));
  }
}
