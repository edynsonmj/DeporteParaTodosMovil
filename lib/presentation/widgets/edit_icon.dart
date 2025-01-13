import 'package:flutter/material.dart';

class EditIcon extends StatelessWidget {
  String? ruta;
  EditIcon({super.key, this.ruta});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
              if (ruta != null) {Navigator.pushNamed(context, ruta!)}
            },
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
          shadows: [
            Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 5)
          ],
        ));
  }
}
