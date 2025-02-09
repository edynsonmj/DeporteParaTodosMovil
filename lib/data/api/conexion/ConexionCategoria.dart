import 'package:movil/data/models/categoriaModelo.dart';

abstract class ConexionCategoria {
  Future<List<categoriaModelo>> obtenerCategorias();
  Future<categoriaModelo> guardarCategoria(categoriaModelo categoria);
}
