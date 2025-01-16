import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/presentation/screens/curso.dart';
import 'package:movil/presentation/screens/cursos.dart';
import 'package:movil/presentation/screens/grupo.dart';
import 'package:movil/presentation/screens/inicio.dart';
import 'package:movil/presentation/screens/page1.dart';
import 'package:movil/presentation/screens/page2.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRutas.inicio:
      return MaterialPageRoute(builder: (_) => Inicio());

    case AppRutas.page2:
      const String args = "hola";
      return MaterialPageRoute(builder: (_) => const Page2(args));

    case AppRutas.cursos:
      return MaterialPageRoute(builder: (_) => Cursos());

    case AppRutas.curso:
      return MaterialPageRoute(builder: (_) => Curso());

    case AppRutas.grupo:
      return MaterialPageRoute(builder: (_) => Grupo());

    default:
      return MaterialPageRoute(builder: (_) => const Page1());
  }
}
