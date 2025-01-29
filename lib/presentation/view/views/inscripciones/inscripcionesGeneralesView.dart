import 'package:flutter/material.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/viewmodels/categoriaViewModel.dart';
import 'package:provider/provider.dart';

class InscripcionesGeneralesView extends StatefulWidget {
  const InscripcionesGeneralesView({super.key});
  @override
  State<InscripcionesGeneralesView> createState() {
    return _InscripcionesGeneralesState();
  }
}

class _InscripcionesGeneralesState extends State<InscripcionesGeneralesView> {
  //estado
  CategoriaViewModel categoriaViewModel = CategoriaViewModel();
  String? _categoriaSeleccionada;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //obtenemos cada vez que se inicialize el widget y asignamos el provider
      categoriaViewModel =
          Provider.of<CategoriaViewModel>(context, listen: false);
      //cargamos las categorias
      categoriaViewModel.fetchCategorias();
    });
  }

  @override
  Widget build(BuildContext context) {
    //obtenemos el provider cada vez que se construya el widget
    categoriaViewModel = Provider.of<CategoriaViewModel>(context);
    return Scaffold(
      appBar: Bar(title: 'Inscripciones'),
      body: contenedorSeguro(context),
    );
  }

  SafeArea contenedorSeguro(BuildContext context) {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(padding: EdgeInsets.all(15), child: contenido())));
  }

  Widget filtro() {
    DropdownMenu menu = DropdownMenu(
      hintText: 'sin seleccion',
      helperText: 'seleccion una categoria',
      textAlign: TextAlign.center,
      dropdownMenuEntries: categoriaViewModel.getListaEntradas,
      onSelected: (seleccion) {
        setState(() {
          _categoriaSeleccionada = seleccion;
        });
      },
    );
    return Container(margin: EdgeInsets.symmetric(vertical: 10), child: menu);
  }

  Widget contenido() {
    return Column(children: [
      configuracionGeneral(),
      Divider(
        color: ColorTheme.neutral,
      ),
      configuracionEspecifica()
    ]);
  }

  Widget configuracionGeneral() {
    Widget descripcion = ListTile(
      title: Text('configuracion general', style: Tipografia.cuerpo1()),
      subtitle: Text(
          'A continuacion selecciones la categoria de la cual desea manipular todas las inscripciones',
          style: Tipografia.cuerpo2()),
    );
    Widget abrir = OutlinedButton(
      onPressed: () {
        if (_categoriaSeleccionada != null) {
          _confirmarAbrir(context, _categoriaSeleccionada!);
        }
      },
      child: Text('Abrir'),
    );
    Widget cerrar = OutlinedButton(
        onPressed: () {
          if (_categoriaSeleccionada != null) {
            _confirmarCerrar(context, _categoriaSeleccionada!);
          }
        },
        style: OutlinedButton.styleFrom(
            foregroundColor: ColorTheme.secondary,
            side: BorderSide(color: ColorTheme.secondary)),
        child: Text('Cerrar'));
    Widget programar = OutlinedButton(
        onPressed: () {
          if (_categoriaSeleccionada != null) {
            _mostrarSelectorFecha(context);
          }
        },
        style: OutlinedButton.styleFrom(
            foregroundColor: ColorTheme.tertiary,
            side: BorderSide(color: ColorTheme.tertiary)),
        child: Text('Programar'));
    Widget acciones = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [abrir, cerrar, programar]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [descripcion, filtro(), acciones],
    );
  }

  Widget configuracionEspecifica() {
    Widget descripcion = ListTile(
        title: Text('configuracion detallada', style: Tipografia.cuerpo1()),
        subtitle: Text(
            'si deseas una configuracion inscripciones detallada para cada curso',
            style: Tipografia.cuerpo2()));
    Widget boton =
        FilledButton(onPressed: () {}, child: Text('CONFIGURACION DETALLADA'));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [descripcion, boton],
    );
  }

  void _confirmarAbrir(BuildContext context, String categoria) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Abrir Inscripciones '),
            content: Text(
                '¿Esta seguro de abrir las inscripciones de todos los grupos para la categoria $categoria?',
                textAlign: TextAlign.center),
            actions: [
              TextButton(
                  onPressed: () {
                    //TODO: llamar funcion que ejecute la accion de confirmar
                    //cierra el alert
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirmar')),
              TextButton(
                  onPressed: () {
                    //cierra el dialogo
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                  style: FilledButton.styleFrom(
                      foregroundColor: ColorTheme.secondary))
            ],
          );
        });
  }

  void _confirmarCerrar(BuildContext context, String categoria) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cerrar Inscripciones '),
            content: Text(
              '¿Esta seguro de cerrar las inscripciones de todos los grupos para la categoria $categoria?',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    //TODO: llamar funcion para ejecutar accion
                    //cierra el alert
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirmar')),
              TextButton(
                onPressed: () {
                  //cierra el dialogo
                  Navigator.of(context).pop();
                },
                style: FilledButton.styleFrom(
                    foregroundColor: ColorTheme.secondary),
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }

  void _mostrarSelectorFecha(BuildContext context) async {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      helpText: 'Grupos de $_categoriaSeleccionada abren en...',
    );

    if (fechaSeleccionada != null) {
      _confirmarProgramacion(context, fechaSeleccionada);
    }
  }

  void _confirmarProgramacion(BuildContext context, DateTime fechaSeccionada) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Programar'),
            content: Text(
              '¿Esta seguro de abrir las inscripciones de todos los grupos de $_categoriaSeleccionada en la fecha ${fechaSeccionada.day}/${fechaSeccionada.month}/${fechaSeccionada.year}?',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    //TODO: llamar funcion para ejecutar accion
                    //cierra el alert
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirmar')),
              TextButton(
                onPressed: () {
                  //cierra el dialogo
                  Navigator.of(context).pop();
                },
                style: FilledButton.styleFrom(
                    foregroundColor: ColorTheme.secondary),
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }
}
