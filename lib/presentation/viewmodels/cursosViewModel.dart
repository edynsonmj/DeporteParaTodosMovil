import 'package:flutter/material.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/domain/servicios/servicioCurso.dart';

class CursosViewModel with ChangeNotifier {
  //servicio a usar
  final ServicioCurso servicioCurso;
  //lista de cursos
  List<CursoEntidad>? _listaCursos;
  //get para acceder a la lista
  List<CursoEntidad>? get getListaCursos => _listaCursos;

  //constructor
  CursosViewModel() : servicioCurso = ServicioCurso();

  Future<void> cargarListaCursos() async {
    try {
      _listaCursos = await servicioCurso.call();
      notifyListeners();
    } catch (e) {
      print('error en CursosViewModel: $e');
    }
  }
}
