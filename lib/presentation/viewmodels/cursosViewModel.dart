import 'package:flutter/material.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/domain/servicios/servicioCurso.dart';

class CursosViewModel with ChangeNotifier {
  //servicio a usar
  final ServicioCurso servicioCurso;
  //lista de cursos
  List<CursoEntidad>? _listaCursos;
  //lista entradas para el desplegable
  List<DropdownMenuEntry> _listaEntradas = [];
  //get para acceder a la lista
  List<CursoEntidad>? get getListaCursos => _listaCursos;
  //get para acceder a la lista de entradas para el desplegable
  List<DropdownMenuEntry> get getListaEntradas => _listaEntradas;

  //constructor
  CursosViewModel() : servicioCurso = ServicioCurso();

  Future<void> cargarListaCursos() async {
    try {
      _listaCursos = await servicioCurso.call();
      _cargarEntradas();
      notifyListeners();
    } catch (e) {
      print('error en CursosViewModel: $e');
    }
  }

  void _cargarEntradas() {
    if (_listaCursos != null && _listaCursos!.isNotEmpty) {
      _listaEntradas = _listaCursos!.map((curso) {
        return DropdownMenuEntry(
            value: curso.nombreCurso, label: curso.nombreCurso);
      }).toList();
    } else {
      _listaEntradas = [];
    }
  }
}
