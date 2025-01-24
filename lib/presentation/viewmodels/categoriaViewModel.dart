import 'package:flutter/material.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/servicios/servicioCategoria.dart';

class CategoriaViewModel with ChangeNotifier {
  final ServicioCategoria servicioCategoria;
  //lista de categorias, privada.
  List<CategoriaEntidad>? _categorias;
  //get para manipulacion de la lista fuera del viewModel.
  List<CategoriaEntidad>? get categorias => _categorias;
  //constructor
  CategoriaViewModel() : servicioCategoria = ServicioCategoria();

  Future<void> fetchCategorias() async {
    try {
      _categorias = await servicioCategoria.call();
      notifyListeners();
    } catch (e) {
      //TODO: manejar error
      print(e);
    }
  }
}
