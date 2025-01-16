import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/tarjeta.dart';

class Cursos extends StatelessWidget {
  const Cursos({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(title: 'cursos'), body: contenedorSeguro(context));
  }

  ///Contenido de la vista, donde se evita que los elementos se sobrepongan sobre elementos de la interfaz del dispositivo
  SafeArea contenedorSeguro(BuildContext context) {
    //orientacion del dispositivo
    final Orientation orientacion = MediaQuery.of(context).orientation;

    //primera seccion de la pantalla
    Container contenidoEstatico = Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            filtro(),
            TextButton(onPressed: () {}, child: Text('INSCRIPCIONES'))
          ],
        ));

    //elementos de la vista sobre las cuales se puede hacer scroll
    Expanded listaItems = componenteLista(orientacion);

    return SafeArea(
        child: Column(
      children: [contenidoEstatico, listaItems],
    ));
  }

  Expanded componenteLista(Orientation orientacion) {
    return Expanded(
      child: Center(
          child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
                padding: orientacion == Orientation.portrait
                    ? EdgeInsets.symmetric(horizontal: 30)
                    : EdgeInsets.symmetric(horizontal: 160),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('AJUSTES'),
                  icon: Icon(Icons.add),
                ));
          }
          return Center(child: Tarjeta(rutaTarjeta: AppRutas.curso));
        },
      )),
    );
  }

  DropdownMenu filtro() {
    String? opcion;
    DropdownMenu menu = DropdownMenu(
      initialSelection: 'opcion 1',
      textAlign: TextAlign.center,
      width: 155,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'opcion 1', label: 'todos'),
        DropdownMenuEntry(value: 'opcion 2', label: 'seleccionado'),
        DropdownMenuEntry(value: 'opcion 3', label: 'recreativo')
      ],
      onSelected: (seleccion) {
        print(seleccion.toString());
      },
    );
    return menu;
    /*return DropdownButton(
        value: opcion,
        hint: const Text('FILTRO'),
        onChanged: (nuevoValor) {
          opcion = nuevoValor;
          //TODO: actualizar la lista segun seleccion
        },
        items: const [
          DropdownMenuItem(value: 'opcion 1', child: Text('todos')),
          DropdownMenuItem(value: 'opcion 2', child: Text('seleccionado')),
          DropdownMenuItem(value: 'opcion 3', child: Text('semillero'))
        ]);*/
  }
}
