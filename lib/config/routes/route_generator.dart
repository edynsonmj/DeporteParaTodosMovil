import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/presentation/view/views/Categorias/CategoriasView.dart';
import 'package:movil/presentation/view/views/alumnos/AlumnoView.dart';
import 'package:movil/presentation/view/views/alumnos/alumnosView.dart';
import 'package:movil/presentation/view/views/curso.dart';
import 'package:movil/presentation/view/views/cursos.dart';
import 'package:movil/presentation/view/views/grupo.dart';
import 'package:movil/presentation/view/views/inscripciones/inscripcionesGeneralesView.dart';
import 'package:movil/presentation/view/views/inscripciones/inscripcionesParticulares.dart';
import 'package:movil/presentation/view/views/instructores/InstructorView.dart';
import 'package:movil/presentation/view/views/instructores/InstructoresView.dart';
import 'package:movil/presentation/view/views/page1.dart';
import 'package:movil/presentation/view/views/page2.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRutas.page2:
      const String args = "hola";
      return MaterialPageRoute(builder: (_) => const Page2(args));

    case AppRutas.cursos:
      return MaterialPageRoute(builder: (_) => CursosView());

    case AppRutas.curso:
      return MaterialPageRoute(builder: (_) => Curso());

    case AppRutas.grupo:
      return MaterialPageRoute(builder: (_) => Grupo());

    case AppRutas.categorias:
      return MaterialPageRoute(builder: (_) => CategoriasView());

    case AppRutas.InscripcionesGenerales:
      return MaterialPageRoute(builder: (_) => InscripcionesGeneralesView());

    case AppRutas.InscripcionesParticulares:
      return MaterialPageRoute(builder: (_) => InscripcionesParticularesView());

    case AppRutas.alumnos:
      return MaterialPageRoute(builder: (_) => Alumnosview());

    case AppRutas.alumno:
      String datos = settings.arguments.toString();
      return MaterialPageRoute(builder: (_) => Alumnoview(alumno: datos));

    case AppRutas.instructores:
      return MaterialPageRoute(builder: (_) => Instructoresview());

    case AppRutas.instructor:
      String datos = settings.arguments.toString();
      return MaterialPageRoute(
          builder: (_) => Instructorview(instructor: datos));

    default:
      return MaterialPageRoute(builder: (_) => Page1());
  }
}
