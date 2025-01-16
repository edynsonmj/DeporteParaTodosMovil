import 'package:flutter/material.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/core/theme/tipografia.dart';

class MiniTarjetaobsolet extends StatelessWidget {
  double margenSuperior;
  double margenInferior;
  double margenIzquierdo;
  double margenDerecho;
  String titulo;
  String subtitulo;
  String indicador;
  String indicadorEstado;
  String urlImagen;
  String? ruta;

  MiniTarjetaobsolet({
    super.key,
    this.ruta,
    required this.urlImagen,
    required this.titulo,
    required this.subtitulo,
    required this.indicador,
    required this.indicadorEstado,
    this.margenSuperior = 5,
    this.margenInferior = 5,
    this.margenIzquierdo = 5,
    this.margenDerecho = 5,
  });

  @override
  Widget build(BuildContext context) {
    return tarjeta(context, ruta);
  }

  Widget tarjeta(BuildContext context, String? ruta) {
    Card tarjeta = Card(
      elevation: 4,
      margin: EdgeInsets.fromLTRB(
          margenIzquierdo, margenSuperior, margenDerecho, margenInferior),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [campoImagen(), campoInformacion(context)],
            ),
          ),
          onTap: () {
            if (ruta != null) {
              Navigator.pushNamed(context, ruta);
            }
          }),
    );

    return tarjeta;
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

  Widget campoInformacion(context) {
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
        urlImagen,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Tipografia.subtitulo1(color: ColorTheme.primary)),
        Text(subtitulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Tipografia.cuerpo2())
      ]),
    );
  }

  Widget indicadores() {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(this.indicador,
          style: Tipografia.cuerpo2(color: ColorTheme.neutral)),
      Chip(
          label: Text(
            this.indicadorEstado,
          ),
          labelPadding: EdgeInsets.all(0))
    ]);
  }
}
