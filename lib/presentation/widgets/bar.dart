import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Bar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
