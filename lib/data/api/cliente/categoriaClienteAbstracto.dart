import 'package:movil/data/models/categoriaModelo.dart';

abstract class CategoriaClienteAbstracto {
  Future<List<categoriaModelo>> obtenerCategorias();
}
