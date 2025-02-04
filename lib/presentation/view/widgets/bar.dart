import 'package:flutter/material.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Bar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading:
          //manejo manual del leading, condicional para verificar que es posible retornar
          ModalRoute.of(context)?.canPop == true
              //si se puede retornar muestre el boton de retorno
              ? BackButton()
              : null,
      title: Text(title, style: Tipografia.h5(color: ColorTheme.primary)),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
