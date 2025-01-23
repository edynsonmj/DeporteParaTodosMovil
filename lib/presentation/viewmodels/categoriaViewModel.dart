import 'package:flutter/material.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/usercases/obtenerCategoria.dart';

class CategoriaViewModel with ChangeNotifier {
  final ObtenerCategorias obtenerCategorias;
  //lista de categorias, privada.
  List<CategoriaEntidad>? _categorias;
  //get para manipulacion de la lista fuera del viewModel.
  List<CategoriaEntidad>? get categorias => _categorias;
  //constructor
  CategoriaViewModel(this.obtenerCategorias);

  Future<void> fetchCategorias() async {
    try {
      _categorias = await obtenerCategorias.call();
      notifyListeners();
    } catch (e) {
      //TODO: manejar error
      print(e);
    }
  }
}
