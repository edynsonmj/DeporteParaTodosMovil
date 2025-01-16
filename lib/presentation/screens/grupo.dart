import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/campoBusqueda.dart';
import 'package:movil/presentation/widgets/encabezadoImagen.dart';
import 'package:movil/presentation/widgets/mini_tarjeta.dart';

class Grupo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'grupo'),
      body: scroll(context),
    );
  }

  Widget scroll(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EncabezadoImagen(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: contenedor(),
          )
        ],
      ),
    );
  }

  Widget contenedor() {
    return Column(
      children: [
        CampoBusqueda(),
        MiniTarjeta(
          margenSuperior: 20,
          urlImagen:
              'https://img.asmedia.epimg.net/resizer/v2/2VYSIIZKZNBWJBGDGKHVP2SR7U.jpg?auth=7daff22f993bb1b1c13b1e70bf3edcecad80e4d5d78e9636faa2b040bd872713&width=1200&height=1200&smart=true',
          titulo: 'Edynson Muñoz Jimenez',
          subtitulo: 'Instructor',
          botonCierre: true,
        )
      ],
    );
  }

  Widget informacionCurso() {
    return Container();
  }

  Widget informacionGrupo() {
    return Container();
  }
}
