import 'package:flutter/material.dart';

class EncabezadoImagen extends StatelessWidget {
  String? rutaImagen;
  EncabezadoImagen({super.key, this.rutaImagen});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Image.network(
      rutaImagen != null
          ? rutaImagen!
          : 'https://img.asmedia.epimg.net/resizer/v2/2VYSIIZKZNBWJBGDGKHVP2SR7U.jpg?auth=7daff22f993bb1b1c13b1e70bf3edcecad80e4d5d78e9636faa2b040bd872713&width=1200&height=1200&smart=true',
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ));
  }
}
