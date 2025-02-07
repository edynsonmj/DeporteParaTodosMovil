import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/presentation/view/views/categorias/CategoriaFormulario.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/edit_icon.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';
import 'package:movil/presentation/view/widgets/tarjeta.dart';
import 'package:movil/presentation/viewmodels/categoriaViewModel.dart';
import 'package:provider/provider.dart';

class CategoriasView extends StatefulWidget {
  const CategoriasView({super.key});

  @override
  State<CategoriasView> createState() {
    return _CategoriasViewState();
  }
}

class _CategoriasViewState extends State<CategoriasView> {
  //Definimos el estado al iniciar la vista
  @override
  void initState() {
    super.initState();
    //nos aseguramos que el contexto este cargado antes de hace el llamdo de los datos
    //la funcion se ejecuta despues de que se renderice el primer fotograma de la pantalla, esto asegura que el contexto estara cargado
    //evita errores de contexto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //accedemos al provider
      final categoriaViewModel =
          //la vardera listen:false asegura que no se cargue nuevamente los datos al acceder a la pantalla
          //para este caso necesitamos que la peticion solo se haga cuando se abre la vista
          Provider.of<CategoriaViewModel>(context, listen: false);
      //cargamos las categorias
      categoriaViewModel.fetchCategorias();
    });
  }

  @override
  Widget build(BuildContext context) {
    //accedemos al provider para usar los datos
    final categoriaViewModel = Provider.of<CategoriaViewModel>(context);
    return Scaffold(
        appBar: Bar(title: 'Categorias'),
        drawer: Menulateral(),
        body: contenedorSeguro(categoriaViewModel));
  }

  Widget contenedorSeguro(CategoriaViewModel viewModel) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRutas.editarCategoria);
              },
              label: Text('Agregar categoria'),
              icon: Icon(Icons.add)),
          listaCategorias(viewModel),
        ],
      ),
    ));
  }

  Widget listaCategorias(CategoriaViewModel viewModel) {
    return ListView.builder(
        shrinkWrap: true, // Ajusta el tamaño de la lista al contenido
        //evita scroll interno
        physics: const NeverScrollableScrollPhysics(),
        //la lista se construira segun el tamaño de la lista categorias del viewmodel
        itemCount: viewModel.categorias?.length ?? 0,
        itemBuilder: (context, index) {
          final CategoriaEntidad categoria = viewModel.categorias![index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [mostrarTarjeta(categoria)],
          );
        });
  }

  Widget mostrarTarjeta(CategoriaEntidad categoria) {
    return Stack(
      children: [
        Tarjeta(
            atrTitulo: categoria.titulo,
            atrDescripcion: categoria.descripcion,
            atrRutaTarjeta: AppRutas.cursos,
            atrDatosImagen: categoria.imagen?.datos),
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRutas.editarCategoria,
                    arguments: categoria);
              },
              icon: EditIcon()),
        )
      ],
    );
  }
}
