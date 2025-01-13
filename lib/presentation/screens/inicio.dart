import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/presentation/widgets/bar.dart';
import 'package:movil/presentation/widgets/tarjeta.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(title: 'deporte para todos'),
        body: SafeArea(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tarjeta(
                          deporte: 'futbol',
                          categoria: 'semillero',
                          rutaTarjeta: AppRutas.cursos,
                          rutaEdicion: AppRutas.curso),
                    ],
                  );
                })));
  }
}
