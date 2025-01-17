import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/core/theme/tipografia.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/edit_icon.dart';
import 'package:movil/presentation/widgets/encabezadoImagen.dart';
import 'package:movil/presentation/widgets/mini_tarjeta.dart';

class Curso extends StatelessWidget {
  const Curso({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Bar(title: 'Curso X'), body: contenedorSeguro());
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
              'Futbol femenino',
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
            'Recreativo',
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
        return MiniTarjeta(
          urlImagen:
              'https://img.asmedia.epimg.net/resizer/v2/2VYSIIZKZNBWJBGDGKHVP2SR7U.jpg?auth=7daff22f993bb1b1c13b1e70bf3edcecad80e4d5d78e9636faa2b040bd872713&width=1200&height=1200&smart=true',
          titulo: 'Grupo: 2024.2',
          subtitulo: 'Futbol',
          indicador: '6/20',
          indicadorEstado: 'activo',
          ruta: AppRutas.grupo,
        );
      },
    );
  }
}
