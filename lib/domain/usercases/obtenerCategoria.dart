import 'package:movil/data/repositories/categoriaRepositorio.dart';
import 'package:movil/data/sources/remote/mock/CategoriaServicio.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';

class ObtenerCategorias {
  final CategoriaRepositorio repositorio =
      CategoriaRepositorio(CategoriaServicio());
  ObtenerCategorias();
  Future<List<CategoriaEntidad>> call() async {
    return await repositorio.obtenerCategorias();
  }
}
