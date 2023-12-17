import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  final Icon menuIcon;

  MenuModel(
      {required this.name,
      this.menuIcon = const Icon(
        Icons.abc,
        color: Colors.transparent,
      )});
}
