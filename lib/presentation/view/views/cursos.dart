import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/tarjeta.dart';

class Cursos extends StatelessWidget {
  const Cursos({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(title: 'Cursos'), body: contenedorSeguro(context));
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
    //encapsulo todo en safeArea
    return SafeArea(
        child: Column(
      children: [contenidoEstatico, listaItems],
    ));
  }

  Expanded componenteLista(Orientation orientacion) {
    return Expanded(
      child: Center(
          child: ListView.builder(
        itemCount: 6,
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
          return Center(
              child: Tarjeta(
            atrRutaTarjeta: AppRutas.curso,
            atrRutaEdicion: AppRutas.curso,
            atrTitulo: 'curso $index',
            atrInfo1: 'deporte $index',
            atrInfo2: 'categoria $index',
            atrDescripcion:
                'Id anim dolor cillum est aliquip ipsum laboris pariatur id. Fugiat anim ad velit minim id irure Lorem fugiat aute eu. Elit esse anim ad dolore enim sunt non dolore veniam tempor voluptate. Dolore amet excepteur deserunt cillum exercitation dolor Lorem officia ad magna officia consequat cupidatat Lorem. Sint voluptate voluptate ut et consequat quis culpa id officia cillum. In in dolor amet consectetur ut laborum excepteur aliqua. Quis consequat ullamco nisi fugiat ipsum minim sint tempor consequat in nulla.',
            atrInfoPie: '${(index + 1) * 5} alumnos',
          ));
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
