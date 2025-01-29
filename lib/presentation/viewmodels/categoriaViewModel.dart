import 'package:flutter/material.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/servicios/servicioCategoria.dart';

class CategoriaViewModel with ChangeNotifier {
  final ServicioCategoria servicioCategoria;
  //lista de categorias, privada.
  List<CategoriaEntidad>? _categorias;
  //get para manipulacion de la lista fuera del viewModel.
  List<CategoriaEntidad>? get categorias => _categorias;
  //lista entradas
  List<DropdownMenuEntry> _listaEntradas = [];
  //
  List<DropdownMenuEntry> get getListaEntradas => _listaEntradas;
  //constructor
  CategoriaViewModel() : servicioCategoria = ServicioCategoria();

  Future<void> fetchCategorias() async {
    try {
      _categorias = await servicioCategoria.call();
      _cargarEntradas();
      notifyListeners();
    } catch (e) {
      //TODO: manejar error
      print(e);
    }
  }

  void _cargarEntradas() {
    if (_categorias != null && _categorias!.isNotEmpty) {
      _listaEntradas = _categorias!.map((categoria) {
        return DropdownMenuEntry(
            value: categoria.titulo, label: categoria.titulo);
      }).toList();
    } else {
      _listaEntradas = [];
    }
  }
}
