import 'package:flutter/material.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/presentation/view/widgets/edit_icon.dart';

//TODO: establecer tamaño predeterminado para el contenedor de la imagen
//TODO: definir imagen por defecto para la imagen
///Widget sin estado que muestra una tarjeta con imagen e informacion
class Tarjeta extends StatelessWidget {
  String? atrUrlImagen;
  String? atrTitulo;
  String? atrDescripcion;
  String? atrInfo1;
  String? atrInfo2;
  String? atrInfoPie;
  String? atrRutaTarjeta;
  String? atrRutaEdicion;

  Tarjeta(
      {super.key,
      //la url de la imagen no puede ser nula, pero si vacia, en cuyo caso tomara el valor por defecto
      this.atrUrlImagen = '',
      this.atrTitulo,
      this.atrDescripcion,
      this.atrInfo1,
      this.atrInfo2,
      this.atrInfoPie,
      this.atrRutaTarjeta,
      this.atrRutaEdicion});
  @override
  Widget build(BuildContext context) {
    return tarjeta(context);
  }

  Widget tarjeta(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    Card tarjeta = Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        elevation: 4,
        //border redondeados
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //Stack permite posicionar elementos sobre elementos, con el arguemento positioned
        child: SizedBox(
            width: dimension.width * 0.8,
            child: Stack(
              children: [
                //Retorna un SisedBox, el cual contiene la primera capa de Stack lo cual es el contenido de la tarjeta.
                cardBox(context, dimension, atrRutaTarjeta),
                //se posiciona sobre la tarjeta el icono de edicion
                if (atrRutaEdicion != null)
                  Positioned(
                      top: 8, right: 8, child: EditIcon(ruta: atrRutaEdicion))
              ],
            )));
    return tarjeta;
  }

  //contenido de la carta encapsulado
  InkWell cardBox(BuildContext context, Size dimension, String? route) {
    //Inkwell permite definir un comportamiento al tocar el elemento
    return InkWell(
      //el contenido de la tarjeta se organizara en una columna
      child: Column(
        children: [
          if (atrUrlImagen != null) imagen(context, dimension),
          titulo(),
          //notese que se hacen las validaciones previo a pasar los datos, para no tener errores de null
          if (atrInfo2 != null && atrInfo1 != null) info(atrInfo1!, atrInfo2!),
          if (atrDescripcion != null) descripcion(atrDescripcion!),
          if (atrInfoPie != null) pieTarjeta(atrInfoPie!)
        ],
      ),
      //comportamiento de Inkwell sobre la carta sera un enrutado a otra vista
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  Widget imagen(BuildContext context, Size dimension) {
    return ClipRRect(
      //border redondeador en la parte superior
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network(
        atrUrlImagen!,
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

  Widget titulo() {
    return Text((atrTitulo != null) ? atrTitulo! : '',
        style: Tipografia.h6(color: ColorTheme.primary));
  }

  Widget info(String info1, String info2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        chipInfo(info1, ColorTheme.secondary),
        chipInfo(info2, ColorTheme.secondary)
      ],
    );
  }

  Widget chipInfo(String data, Color color) {
    return Chip(
      label: Text(data),
      backgroundColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: 12, color: color),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      side: BorderSide(color: color),
    );
  }

  Widget descripcion(String texto) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: Text(texto,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Tipografia.cuerpo2()));
  }

  Widget pieTarjeta(String texto) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Text(texto,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Tipografia.leyendaNegrita(color: ColorTheme.secondary)));
  }
}
