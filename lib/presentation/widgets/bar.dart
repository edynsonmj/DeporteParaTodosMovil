import 'package:flutter/material.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/core/theme/tipografia.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Bar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Tipografia.h5(color: ColorTheme.primary)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
