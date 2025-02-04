import 'package:flutter/material.dart';
import 'package:movil/presentation/view/widgets/bar.dart';

class Alumnosview extends StatefulWidget {
  const Alumnosview({super.key});

  @override
  State<Alumnosview> createState() {
    return _AlumnosState();
  }
}

class _AlumnosState extends State<Alumnosview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'Alumnos'),
      body: contenedorSeguro(),
    );
  }

  Widget contenedorSeguro() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Text('soy alumnos'),
    ));
  }
}
