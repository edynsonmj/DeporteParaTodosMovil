import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';
import 'package:movil/data/repositories/cursoRepositorio.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/presentation/view/views/grupo.dart';

class ServicioCurso {
  CursoRepositorio repositorio;
  ServicioCurso()
      : repositorio = CursoRepositorio(
            cliente: ClienteFabricaAbstracta.obtenerClienteFabrica()
                .crearClienteCurso());

  Future<List<CursoEntidad>> call() async {
    return await repositorio.obtenerCursos();
  }
}
