import 'package:movil/data/api/cliente/cursoClienteAbstracto.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CursoRepositorio {
  CursoClienteAbstracto cliente;
  CursoRepositorio({required this.cliente});

  Future<List<CursoEntidad>> obtenerCursos() async {
    final listGruposModelo = await cliente.obtenerCursos();
    return listGruposModelo
        .map((modelo) => CursoEntidad(
            nombreCurso: modelo.nombreCurso,
            nombreDeporte: modelo.nombreDeporte,
            tituloCategoria: modelo.tituloCategoria,
            descripcion: modelo.descripcion,
            imagen: (modelo.imagen != null)
                ? (ImagenEntidad(
                    id: modelo.imagen!.id,
                    nombre: modelo.imagen!.nombre,
                    tipoArchivo: modelo.imagen!.tipoArchivo,
                    longitud: modelo.imagen!.longitud,
                    //los datos de la imagen se convierten a un tipo de dato manejable en flutter
                    datos: modelo.imagen!.convertirDeBase64()))
                : null))
        .toList();
  }
}
