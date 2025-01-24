import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/config/routes/route_generator.dart';
import 'package:movil/config/theme/app_tema.dart';
import 'package:movil/domain/servicios/servicioCategoria.dart';
import 'package:movil/presentation/viewmodels/categoriaViewModel.dart';
import 'package:movil/presentation/viewmodels/cursosViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoriaViewModel()),
          ChangeNotifierProvider(create: (_) => CursosViewModel())
        ],
        child: MaterialApp(
          title: 'Deporte para todos',
          theme: AppTheme().theme(),
          initialRoute: AppRutas.page1,
          onGenerateRoute: generateRoute,
        ));
  }
}
