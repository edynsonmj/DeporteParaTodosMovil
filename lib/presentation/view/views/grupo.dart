import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/campoBusqueda.dart';
import 'package:movil/presentation/view/widgets/edit_icon.dart';
import 'package:movil/presentation/view/widgets/encabezadoImagen.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';
import 'package:movil/presentation/view/widgets/mini_tarjeta.dart';

class Grupo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'Futbol masculino'),
      drawer: Menulateral(),
      body: contenedorSeguro(context),
    );
  }

  Widget contenedorSeguro(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          EncabezadoImagen(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: contenedor(),
          )
        ],
      ),
    ));
  }

  Widget contenedor() {
    return Column(
      children: [
        CampoBusqueda(
          leyenda: 'buscar instructor...',
        ),
        MiniTarjeta(
          existeCampoImagen: true,
          atrMargerSuperior: 15,
          atrMargerInferior: 15,
          atrTitulo: 'Edynson Muñoz Jimenez',
          atrSubTitulo: 'Instructor',
          existeBotonCierre: true,
          atrDatosImagen: Uint8List(0),
        ),
        informacionCurso(),
        informacionGrupo(),
        cupos(),
        horarios(),
        alumnos(),
        botonesCierre(),
      ],
    );
  }

  Widget botonesCierre() {
    return Container(
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text('FINALIZAR GRUPO'),
            style: OutlinedButton.styleFrom(
                foregroundColor: ColorTheme.secondary,
                side: BorderSide(color: ColorTheme.secondary)),
          ),
          FilledButton(
            onPressed: () {},
            child: Text('ELIMINAR GRUPO'),
            style:
                FilledButton.styleFrom(backgroundColor: ColorTheme.secondary),
          )
        ],
      ),
    );
  }

  Widget alumnos() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Alumnos', style: Tipografia.h6())),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agregar alumno',
                  style: Tipografia.leyendaNegrita(color: ColorTheme.neutral),
                ),
                CampoBusqueda(leyenda: 'buscar alumno...')
              ],
            )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  shrinkWrap: true, // Ajusta el tamaño de la lista al contenido
                  physics:
                      const NeverScrollableScrollPhysics(), // Desactiva scroll interno
                  itemCount: 20, // Cambia esto según tu lista
                  itemBuilder: (BuildContext context, int index) {
                    //TODO: establecer inkwell para comportamiento al tocar
                    return MiniTarjeta(
                      existeCampoImagen: true,
                      atrTitulo: 'Alumno $index',
                      atrSubTitulo: '123456789',
                      existeBotonCierre: true,
                    );
                  },
                )),
          ],
        ));
  }

  Widget horarios() {
    return Container(
      child: Column(
        children: [
          Text(
            'Horarios',
            style: Tipografia.h6(),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text('AGREGAR HORARIO'),
            icon: Icon(Icons.add),
          ),
          ListView.builder(
            shrinkWrap: true, // Ajusta el tamaño de la lista al contenido
            physics:
                const NeverScrollableScrollPhysics(), // Desactiva scroll interno
            itemCount: 3, // Cambia esto según tu lista
            itemBuilder: (BuildContext context, int index) {
              return MiniTarjeta(
                atrTitulo: 'Martes',
                atrSubTitulo: '3:00 PM - 4:00 PM',
                existeBotonCierre: true,
                existeCampoImagen: false,
              );
            },
          ),
        ],
      ),
    );
  }

  //TODO: establecer radio butons para manejar el estado de las inscripciones
  Widget inscripciones() {
    return Column();
  }

  Widget cupos() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Column(children: [
              ListTile(
                  title: Text('Cupos', style: Tipografia.cuerpo1()),
                  subtitle: Text('20', style: Tipografia.cuerpo2())),
              ListTile(
                  title: Text('Matriculados', style: Tipografia.cuerpo1()),
                  subtitle: Text('20', style: Tipografia.cuerpo2()))
            ]),
            Positioned(child: EditIcon(), top: 8, right: 8)
          ],
        ));
  }

  Widget informacionCurso() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              Text(
                'Informacion del curso',
                style: Tipografia.h6(),
              ),
              ListTile(
                  title: Text('Curso', style: Tipografia.cuerpo1()),
                  subtitle: Text('Futbol masculino - Deporte Recreativo',
                      style: Tipografia.cuerpo2())),
              ListTile(
                  title: Text('Descripcion', style: Tipografia.cuerpo1()),
                  subtitle: Text(
                      style: Tipografia.cuerpo2(),
                      'Eu cillum amet officia excepteur eu fugiat do cupidatat nisi aliquip minim eu do minim. Aliquip non ex consequat magna culpa magna dolor dolore duis esse. Ut minim exercitation adipisicing consequat irure. Esse do sint ut eu velit ea. Pariatur sit pariatur deserunt magna Lorem et sint minim exercitation non proident Lorem velit. Fugiat incididunt et minim ex consequat occaecat et laborum enim culpa dolor minim pariatur in.')),
            ],
          ),
        ));
  }

  Widget informacionGrupo() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              Text('Informacion del Grupo', style: Tipografia.h6()),
              ListTile(
                  title: Text(
                    'Grupo',
                    style: Tipografia.cuerpo1(),
                  ),
                  subtitle: Text(
                    'Fubol masculino: 2024.2 - Deporte Recreativo',
                    style: Tipografia.cuerpo2(),
                  )),
              ListTile(
                  title: Text(
                    'Estado',
                    style: Tipografia.cuerpo1(),
                  ),
                  subtitle: Text(
                    'Activo',
                    style: Tipografia.cuerpo2(),
                  )),
              ListTile(
                  title: Text(
                    'Fecha de creacion',
                    style: Tipografia.cuerpo1(),
                  ),
                  subtitle: Text(
                    'junio 2023',
                    style: Tipografia.cuerpo2(),
                  )),
              ListTile(
                  title: Text(
                    'Fecha finalizacion',
                    style: Tipografia.cuerpo1(),
                  ),
                  subtitle: Text(
                    '...',
                    style: Tipografia.cuerpo2(),
                  )),
            ],
          ),
        ));
  }
}
