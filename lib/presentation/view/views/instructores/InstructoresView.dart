import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';
import 'package:movil/presentation/view/widgets/mini_tarjeta.dart';

class Instructoresview extends StatefulWidget {
  const Instructoresview({super.key});

  @override
  State<Instructoresview> createState() {
    return _AlumnosState();
  }
}

class _AlumnosState extends State<Instructoresview> {
  String? _categoria;
  String? _curso;
  String? _grupo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: 'Alumnos'),
      drawer: Menulateral(),
      body: contenedorSeguro(),
    );
  }

  Widget contenedorSeguro() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: contenido(),
    ));
  }

  Widget contenido() {
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            seccionAgregar(),
            //TODO: apartado para busqueda
            seccionFiltros(),
            Divider(),
            seccionListado()
          ],
        );
      }),
    );
  }

  Widget seccionAgregar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton.icon(
          onPressed: () {},
          label: Text('AGREGAR ALUMNO'),
          icon: Icon(Icons.add)),
    );
  }

  Widget seccionFiltros() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            filtroCategoria(),
            if (_categoria != null) filtroCurso(),
            if (_curso != null && _categoria != null) filtroGrupo(),
          ],
        ));
  }

  Widget filtroCategoria() {
    DropdownMenu menu = DropdownMenu(
        helperText: 'seleccione una categoria',
        hintText: 'Sin seleccion',
        textAlign: TextAlign.center,
        onSelected: (value) {
          setState(() {
            _categoria = value;
            if (_categoria == null) {
              _curso = null;
              _grupo = null;
            }
          });
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(value: null, label: 'sin seleccion'),
          DropdownMenuEntry(value: 'seleccionado', label: 'seleccionado'),
          DropdownMenuEntry(value: 'semillero', label: 'semillero'),
          DropdownMenuEntry(value: 'recreativo', label: 'recreativo'),
        ]);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: menu,
    );
  }

  Widget filtroCurso() {
    DropdownMenu menu = DropdownMenu(
        helperText: 'seleccione un curso',
        hintText: 'Sin seleccion',
        textAlign: TextAlign.center,
        onSelected: (value) {
          setState(() {
            _curso = value;
            if (_curso == null) {
              _grupo = null;
            }
          });
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(value: null, label: 'sin seleccion'),
          DropdownMenuEntry(value: 'curso 1', label: 'curso 1'),
          DropdownMenuEntry(value: 'curso 2', label: 'curso 2'),
          DropdownMenuEntry(value: 'curso 3', label: 'curso 3'),
        ]);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: menu,
    );
  }

  Widget filtroGrupo() {
    DropdownMenu menu = DropdownMenu(
        helperText: 'seleccione un grupo',
        hintText: 'Sin seleccion',
        textAlign: TextAlign.center,
        onSelected: (value) {
          setState(() {
            _grupo = value;
          });
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(value: null, label: 'sin seleccion'),
          DropdownMenuEntry(value: 'grupo 1', label: 'grupo 1'),
          DropdownMenuEntry(value: 'grupo 2', label: 'grupo 2'),
          DropdownMenuEntry(value: 'grupo 3', label: 'grupo 3'),
        ]);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: menu,
    );
  }

  Widget seccionListado() {
    return Container(
      child: Column(
        children: [
          Text(
            'Listado alumno',
            style: Tipografia.h5(),
          ),
          listadoAlumnos(),
        ],
      ),
    );
  }

  Widget listadoAlumnos() {
    return ListView.builder(
        //ajusta el tamaño de la lista al contenido
        shrinkWrap: true,
        //desactiva el scroll interno
        physics: const NeverScrollableScrollPhysics(),
        //TODO: cambiar valor por el de la longitud lista del provider
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: MiniTarjeta(
              atrTitulo: 'alumno $index',
              atrSubTitulo: 'identificacion $index',
              existeCampoImagen: true,
              atrIndicadorEstado: 'tipo',
              atrIndicador: 'facultad',
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRutas.alumno,
                  arguments: 'alumno $index');
            },
          );
        });
  }
}
