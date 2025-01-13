import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/presentation/widgets/bar.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(
        title: 'page1',
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => pressed(context), child: const Text("ir a page2")),
      ),
    );
  }

  void pressed(BuildContext context) {
    Navigator.pushNamed(context, AppRutas.page2, arguments: 'hola');
  }
}
