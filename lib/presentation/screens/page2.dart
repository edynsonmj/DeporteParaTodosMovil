import 'package:flutter/material.dart';
import 'package:movil/core/routes/app_rutas.dart';
import 'package:movil/presentation/widgets/bar.dart';

class Page2 extends StatelessWidget {
  const Page2(String args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'page2'),
      body: Center(
        child: MaterialButton(
            onPressed: () => pressed(context),
            child: const Text("estoy en 2 ir a page1")),
      ),
    );
  }

  void pressed(BuildContext context) {
    Navigator.pushNamed(context, AppRutas.page1);
  }
}
