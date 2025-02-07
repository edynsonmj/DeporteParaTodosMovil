import 'package:movil/data/models/cursoModelo.dart';

abstract class ConexionCurso {
  Future<List<CursoModelo>> obtenerCursos();
}
