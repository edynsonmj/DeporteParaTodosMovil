import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/core/theme/color_tema.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/edit_icon.dart';
import 'package:movil/presentation/widgets/mini_tarjeta.dart';
import 'package:movil/presentation/widgets/tarjeta.dart';

class Curso extends StatelessWidget {
  const Curso({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(title: 'un curso'),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Contenido estático
            imagen(context),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    informacionCurso(),
                    OutlinedButton.icon(
                        onPressed: () {},
                        label: const Text('agregar grupo'),
                        icon: const Icon(Icons.add)),
                    const Text('Grupos del curso',
                        style: TextStyle(
                            color: ColorTheme.primary,
                            fontWeight: FontWeight.bold)),
                    // Lista dinámica
                    ListView.builder(
                      shrinkWrap:
                          true, // Ajusta el tamaño de la lista al contenido
                      physics:
                          const NeverScrollableScrollPhysics(), // Desactiva scroll interno
                      itemCount: 20, // Cambia esto según tu lista
                      itemBuilder: (BuildContext context, int index) {
                        return MiniTarjeta();
                      },
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Deshabilitar curso'),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: ColorTheme.secondary,
                          side: BorderSide(color: ColorTheme.secondary)),
                    ),
                    FilledButton(
                        onPressed: () {},
                        child: Text('Eliminar curso'),
                        style: FilledButton.styleFrom(
                          backgroundColor: ColorTheme.secondary,
                        ))
                  ],
                )),
          ],
        )));
  }

  ///muestra la imagen representativa del curso
  Widget imagen(BuildContext context) {
    return (Image.network(
      'https://img.asmedia.epimg.net/resizer/v2/2VYSIIZKZNBWJBGDGKHVP2SR7U.jpg?auth=7daff22f993bb1b1c13b1e70bf3edcecad80e4d5d78e9636faa2b040bd872713&width=1200&height=1200&smart=true',
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ));
  }

//muestra la informacion del curso
  Widget informacionCurso() {
    const Text titulo = Text(
      'Informacion del curso',
      style: TextStyle(
        color: ColorTheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );

    Column datos = const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text('Curso'),
            subtitle: Text('Futbol femenino'),
            contentPadding: EdgeInsets.symmetric()),
        ListTile(
          title: Text('Deporte'),
          subtitle: Text('Futbol'),
          contentPadding: EdgeInsets.symmetric(),
        ),
        ListTile(
          title: Text('Tipo de curso'),
          subtitle: Text('Recreativo'),
          contentPadding: EdgeInsets.symmetric(),
        ),
        ListTile(
          title: Text('Descripción'),
          contentPadding: EdgeInsets.symmetric(),
          subtitle: Text(
              'Mollit enim labore ad cupidatat. Irure incididunt proident ut adipisicing ex deserunt tempor. Laborum irure excepteur enim culpa do sunt ad ullamco enim qui dolor. Ea reprehenderit ad id eiusmod. Sit quis magna do labore amet aliqua qui consectetur officia deserunt aliqua. Voluptate aute ipsum adipisicing cillum.'),
        )
      ],
    );

    Container contenedor = Container(
      //margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [titulo, datos],
      ),
    );

    return Stack(
      children: [contenedor, Positioned(top: 30, right: 8, child: EditIcon())],
    );
  }
}
