import 'package:flutter/material.dart';
import 'package:movil/core/theme/color_tema.dart';

class MiniTarjeta extends StatelessWidget {
  double margenSuperior;
  double margenInferior;
  double margenIzquierdo;
  double margenDerecho;

  MiniTarjeta(
      {super.key,
      this.margenSuperior = 5,
      this.margenInferior = 5,
      this.margenIzquierdo = 5,
      this.margenDerecho = 5});

  @override
  Widget build(BuildContext context) {
    return tarjeta(context);
  }

  Widget tarjeta(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.fromLTRB(
          margenIzquierdo, margenSuperior, margenDerecho, margenInferior),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [campoImagen(), campoInformacion()],
        ),
      ),
    );
  }

  Widget campoImagen() {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.primary, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: imagen(),
    );
  }

  Widget campoInformacion() {
    Row fila = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        informacionTextual(),
        indicadores(),
      ],
    );
    return Expanded(child: fila);
  }

  Widget imagen() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        'https://img.asmedia.epimg.net/resizer/v2/2VYSIIZKZNBWJBGDGKHVP2SR7U.jpg?auth=7daff22f993bb1b1c13b1e70bf3edcecad80e4d5d78e9636faa2b040bd872713&width=1200&height=1200&smart=true',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          //TODO: poner una imagen de carga
          return const Text('cargando');
        },
      ),
    );
  }

  Widget informacionTextual() {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('data'), Text('data')]),
    );
  }

  Widget indicadores() {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text('data'), Text('data')]),
    );
  }
}
