import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
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
  @override
  void initState() {
    super.initState(); // Llamar a fetchCategories al iniciar la vista
    final categoriaviewmodel =
        Provider.of<CategoriaViewModel>(context, listen: false);
    categoriaviewmodel.fetchCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Bar(title: 'Categorias'), body: contenedorSeguro());
  }

  Widget contenedorSeguro() {
    return SafeArea(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tarjeta(
                      atrTitulo: 'categoria $index',
                      atrDescripcion:
                          'Aute nostrud deserunt ullamco voluptate aliqua anim anim deserunt ullamco nostrud. Labore pariatur ea amet non eu sunt. Esse labore nulla et sint consectetur sunt. Aliqua eu Lorem laboris mollit fugiat cupidatat nisi laboris et non. Quis nisi dolor esse laboris minim tempor veniam nostrud. Ex magna laboris mollit in amet officia quis tempor non.',
                      atrRutaTarjeta: AppRutas.cursos,
                      atrRutaEdicion: AppRutas.curso),
                ],
              );
            }));
  }
}
