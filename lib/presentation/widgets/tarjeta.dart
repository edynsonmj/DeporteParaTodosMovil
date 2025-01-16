import 'package:flutter/material.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/core/theme/tipografia.dart';
import 'package:movil/presentation/widgets/edit_icon.dart';

///Widget sin estado que muestra una tarjeta con imagen e informacion
class Tarjeta extends StatelessWidget {
  String? deporte;
  String? categoria;
  String? rutaTarjeta;
  String? rutaEdicion;

  Tarjeta(
      {super.key,
      this.deporte,
      this.categoria,
      this.rutaTarjeta,
      this.rutaEdicion});
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
                cardBox(context, dimension, rutaTarjeta),
                //se posiciona sobre la tarjeta el icono de edicion
                if (rutaEdicion != null)
                  Positioned(
                      top: 8, right: 8, child: EditIcon(ruta: rutaEdicion))
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
          imagen(context, dimension),
          titulo(),
          if (categoria != null && deporte != null) info(),
          descripcion(
              'Anim voluptate aliquip veniam ipsum in labore duis adipisicing reprehenderit. Occaecat dolore ut excepteur excepteur dolore exercitation ullamco incididunt ipsum nulla fugiat magna adipisicing veniam. Elit sit amet sint est minim aute elit pariatur commodo. Aliquip ullamco ut exercitation veniam sint nisi irure mollit ad aute labore duis ea eiusmod. Dolore magna fugiat cupidatat nisi officia cillum est. Nostrud reprehenderit eu ut esse exercitation ut ipsum dolore consectetur ut nostrud pariatur.'),
          pieTarjeta('20 alumnos')
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
        //TODO: recibir url
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

  Widget titulo() {
    return Text('soy jinx', style: Tipografia.h6(color: ColorTheme.primary));
  }

  Widget info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        chipInfo('futbol', ColorTheme.secondary),
        chipInfo('seleccionado', ColorTheme.secondary)
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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
