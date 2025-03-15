import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/edit_icon.dart';
import 'package:movil/presentation/view/widgets/encabezadoImagen.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';
import 'package:movil/presentation/view/widgets/mini_tarjeta.dart';

class Curso extends StatelessWidget {
  const Curso({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(title: 'Futbol masculino'),
        body: contenedorSeguro(),
        drawer: Menulateral());
  }

  Widget contenedorSeguro() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        // Contenido estático
        EncabezadoImagen(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                informacionCurso(),
                OutlinedButton.icon(
                    onPressed: () {},
                    label: Text('AGREGAR GRUPO'),
                    icon: const Icon(Icons.add)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Grupos del curso', style: Tipografia.h5()),
                ),
                // Lista dinámica
                listaGrupos(),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorTheme.secondary,
                        side: BorderSide(color: ColorTheme.secondary),
                      ),
                      child: Text('DESHABILITAR CURSO'),
                    )),
                FilledButton(
                    onPressed: () {},
                    child: Text('ELIMINAR CURSO'),
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorTheme.secondary,
                    ))
              ],
            )),
      ],
    )));
  }

//muestra la informacion del curso
  Widget informacionCurso() {
    Column datos = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text(
              'Curso',
              style: Tipografia.cuerpo1(),
            ),
            subtitle: Text(
              'Futbol masculino',
              style: Tipografia.cuerpo2(),
            ),
            contentPadding: EdgeInsets.symmetric()),
        ListTile(
          title: Text('Deporte', style: Tipografia.cuerpo1()),
          subtitle: Text(
            'Futbol',
            style: Tipografia.cuerpo2(),
          ),
          contentPadding: EdgeInsets.symmetric(),
        ),
        ListTile(
          title: Text(
            'Tipo de curso',
            style: Tipografia.cuerpo1(),
          ),
          subtitle: Text(
            'Deporte Recreativo',
            style: Tipografia.cuerpo2(),
          ),
          contentPadding: EdgeInsets.symmetric(),
        ),
        ListTile(
          title: Text('Descripción', style: Tipografia.cuerpo1()),
          contentPadding: EdgeInsets.symmetric(),
          subtitle: Text(
              style: Tipografia.cuerpo2(),
              'Mollit enim labore ad cupidatat. Irure incididunt proident ut adipisicing ex deserunt tempor. Laborum irure excepteur enim culpa do sunt ad ullamco enim qui dolor. Ea reprehenderit ad id eiusmod. Sit quis magna do labore amet aliqua qui consectetur officia deserunt aliqua. Voluptate aute ipsum adipisicing cillum.'),
        )
      ],
    );

    Container contenedor =
        Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 20), child: datos);

    return Stack(
      children: [contenedor, Positioned(top: 30, right: 8, child: EditIcon())],
    );
  }

  Widget listaGrupos() {
    return ListView.builder(
      shrinkWrap: true, // Ajusta el tamaño de la lista al contenido
      physics: const NeverScrollableScrollPhysics(), // Desactiva scroll interno
      itemCount: 20, // Cambia esto según tu lista
      itemBuilder: (BuildContext context, int index) {
        //TODO: establecer inwell para comportamiento al tocar
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRutas.grupo);
            },
            child: MiniTarjeta(
              existeCampoImagen: true,
              atrTitulo: 'Grupo: 2024.2',
              atrSubTitulo: 'Futbol',
              atrIndicador: '6/20',
              atrIndicadorEstado: 'activo',
            ));
      },
    );
  }
}
