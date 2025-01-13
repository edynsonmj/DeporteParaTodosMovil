import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/tarjeta.dart';

class Cursos extends StatelessWidget {
  const Cursos({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientacion = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: Bar(title: 'cursos'),
        body: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                filtro(),
                MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'inscripciones',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: ColorTheme.primary),
              ],
            ),
            Expanded(
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
                          label: Text('Ajustes'),
                          icon: Icon(Icons.add),
                        ));
                  }
                  return Center(child: Tarjeta(rutaTarjeta: AppRutas.curso));
                },
              )),
            )
          ],
        )));
  }

  DropdownButton filtro() {
    String? opcion;
    return DropdownButton(
        value: opcion,
        hint: const Text('filtro'),
        onChanged: (nuevoValor) {
          opcion = nuevoValor;
          //TODO: actualizar la lista segun seleccion
        },
        items: const [
          DropdownMenuItem(value: 'opcion 1', child: Text('todos')),
          DropdownMenuItem(value: 'opcion 2', child: Text('seleccionado')),
          DropdownMenuItem(value: 'opcion 3', child: Text('semillero'))
        ]);
  }
}
