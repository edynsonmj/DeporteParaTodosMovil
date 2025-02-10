import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';

abstract class ConexionCategoria {
  Future<List<categoriaModelo>> obtenerCategorias();
  Future<RespuestaModelo> guardarCategoria(categoriaModelo categoria);
}
