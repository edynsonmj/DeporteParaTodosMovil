import 'package:flutter/material.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';

class MiniTarjeta extends StatelessWidget {
  final double margenSuperior;
  final double margenInferior;
  final double margenIzquierdo;
  final double margenDerecho;
  final String titulo;
  final String subtitulo;

  ///Indicador textual en la parte superior derecha
  String? indicador;

  ///Indicador chip en la parte inferior derecha
  String? indicadorEstado;
  String? urlImagen;
  String? ruta;

  ///habilitar boton de cierre en la parte derecha
  bool botonCierre;

  MiniTarjeta({
    super.key,
    required this.titulo,
    required this.subtitulo,
    this.ruta,
    //la url de la imagen no puede ser nula, pero si vacia, en cuyo caso tomara el valor por defecto
    this.urlImagen = '',
    this.indicador,
    this.indicadorEstado,
    this.botonCierre = false,
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
    final dimension = MediaQuery.of(context).size;
    Card tarjeta = Card(
      elevation: 4,
      margin: EdgeInsets.fromLTRB(
          margenIzquierdo, margenSuperior, margenDerecho, margenInferior),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
          width: dimension.width * 0.9,
          child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    if (urlImagen != null) campoImagen(),
                    campoInformacion(context),
                    if (botonCierre) iconoAccion()
                  ],
                ),
              ),
              onTap: () {
                if (ruta != null) {
                  Navigator.pushNamed(context, ruta);
                }
              })),
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
        if (indicador != null && indicador != null) indicadores(),
      ],
    );
    return Expanded(child: fila);
  }

  Widget iconoAccion() {
    return IconButton(
        onPressed: () {
          print('hola');
        },
        icon: Icon(Icons.close));
  }

  Widget imagen() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        urlImagen!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
              child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ));
        },
        errorBuilder: (context, error, stackTrace) =>
            Image.asset('assets/images/1.jpg'),
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
      //antes de llamar se debe confirmar que los valores existen
      Text(indicador!, style: Tipografia.cuerpo2(color: ColorTheme.neutral)),
      Chip(
          label: Text(
            indicadorEstado!,
          ),
          labelPadding: EdgeInsets.all(0))
    ]);
  }
}
