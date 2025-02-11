import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/data/repositories/cursoRepositorio.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/presentation/view/views/grupo.dart';

class ServicioCurso {
  CursoRepositorio repositorio;
  ServicioCurso()
      : repositorio = CursoRepositorio(
            cliente: ConexionFabricaAbstracta.obtenerConexionFabrica()
                .crearConexionCurso());

  Future<List<CursoEntidad>> call() async {
    return await repositorio.obtenerCursos();
  }

  Future<RespuestaModelo> listarTodosCursos() async {
    return repositorio.listarTodosLosCursos();
  }
}
