import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/core/theme/tipografia.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/campoBusqueda.dart';
import 'package:movil/presentation/widgets/edit_icon.dart';
import 'package:movil/presentation/widgets/encabezadoImagen.dart';
import 'package:movil/presentation/widgets/mini_tarjeta.dart';

class Grupo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'Grupo X'),
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
          margenSuperior: 15,
          margenInferior: 15,
          titulo: 'Edynson Muñoz Jimenez',
          subtitulo: 'Instructor',
          botonCierre: true,
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
                    return MiniTarjeta(
                      titulo: 'Alumno $index',
                      subtitulo: '123456789',
                      botonCierre: true,
                      ruta: AppRutas.inicio,
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
                titulo: 'Martes',
                subtitulo: '3:00 PM - 4:00 PM',
                botonCierre: true,
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
                  subtitle: Text('Futbol femenino - recreativo',
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
                    'Futbol femenino 2023_2 - recreativo',
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
