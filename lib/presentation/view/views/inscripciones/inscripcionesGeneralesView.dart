import 'package:flutter/material.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/config/theme/tipografia.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/mini_tarjeta.dart';
import 'package:movil/presentation/view/widgets/tarjeta.dart';
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
      hintText: 'seleccione...',
      helperText: 'Categoria seleccionada',
      textAlign: TextAlign.center,
      dropdownMenuEntries: categoriaViewModel.getListaEntradas,
      onSelected: (seleccion) {},
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
      onPressed: () {},
      child: Text('Abrir'),
    );
    Widget cerrar = OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            foregroundColor: ColorTheme.secondary,
            side: BorderSide(color: ColorTheme.secondary)),
        child: Text('Cerrar'));
    Widget programar = OutlinedButton(
        onPressed: () {},
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

  void _ventanaEmergente1(BuildContext context, String categoria) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Abrir Inscripciones '),
          );
        });
  }
}
