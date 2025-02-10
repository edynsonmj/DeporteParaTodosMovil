import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/data/repositories/categoriaRepositorio.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCategoriaRemota.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';

class ServicioCategoria {
  CategoriaRepositorio repositorio;

  ServicioCategoria()
      : repositorio = CategoriaRepositorio(
            cliente: ConexionFabricaAbstracta.obtenerConexionFabrica()
                .crearConexionCategoria());

  Future<List<CategoriaEntidad>> call() async {
    return await repositorio.obtenerCategorias();
  }

  Future<RespuestaModelo> insertarCategoria(CategoriaEntidad entidad) async{
    return await repositorio.insertarCategoria(entidad);
  }
}
