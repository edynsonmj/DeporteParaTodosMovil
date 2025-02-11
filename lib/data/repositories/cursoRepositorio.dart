import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/models/cursoModelo.dart';
import 'package:movil/data/models/errorModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CursoRepositorio {
  ConexionCurso cliente;
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

  Future<RespuestaModelo> listarTodosLosCursos() async {
    RespuestaModelo respuesta = await cliente.encontrarTodosCursos();
    if (respuesta.codigoHttp == 200) {
      //El servidor ha respondido correctamente pero se ha convertido al formato correcto
      if (respuesta.datos is! List<CursoModelo>) {
        respuesta.codigoHttp = 0;
        respuesta.error = ErrorModelo(
            codigoHttp: 0,
            mensaje:
                'El servidor ha respondido correctamente, pero el formato entonctrado no corresponde a una lista de CursoModelo',
            url: '/cursos',
            metodo: 'GET');
        return respuesta;
      }
      //El servidor ha respondido correctamente, se transforman los datos
      List<CursoModelo> listaModelo = respuesta.datos as List<CursoModelo>;
      List<CursoEntidad> listaEntidad = [];
      for (var item in listaModelo) {
        CursoEntidad entidad = CursoEntidad.fromModelo(item);
        listaEntidad.add(entidad);
      }
      respuesta.datos = listaEntidad;
      return respuesta;
    }
    //si el codigo no es 200, enviar respuesta que debe contener el error
    return respuesta;
  }
}
