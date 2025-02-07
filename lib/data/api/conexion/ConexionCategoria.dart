import 'package:movil/data/models/categoriaModelo.dart';

abstract class ConexionCategoria {
  Future<List<categoriaModelo>> obtenerCategorias();
}
