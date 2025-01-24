import 'package:movil/data/models/cursoModelo.dart';

abstract class CursoClienteAbstracto {
  Future<List<CursoModelo>> obtenerCursos();
}
