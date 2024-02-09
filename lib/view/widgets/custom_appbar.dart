import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({Key? key, this.actions, required this.title})
      : super(key: key);

  final List<Widget>? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6A00FF),
              Color(0xFF9013FE),
              Color(0xFFC100FF),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        actions: actions);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();
}
