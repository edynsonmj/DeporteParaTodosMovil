import 'package:dio/dio.dart';
import 'package:movil/config/configServicio.dart';
import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/models/cursoModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';

class ConexionCursoRemoto implements ConexionCurso {
  final _dio = Dio(BaseOptions(baseUrl: ConfigServicio().obtenerBaseApi()));

  @override
  Future<List<CursoModelo>> obtenerCursos() async {
    //intentar hacer la peticion
    try {
      print(_dio.options.baseUrl);
      final response = await _dio.get('/cursos');
      print(response.realUri);

      //se espera codigo 200 para la peticion, si no manejar error
      if (response.statusCode != 200) {
        //TODO: no se ha sido exitosa la carga de informacion, manejar error
        return Future.value(null);
      }

      //el response data para este caso retorna una lista de categorias
      //tener en cuenta que la estructura puede cambiar
      List<dynamic> data = response.data;

      //se construye la lista segun el modelo, para ello se usa factory para construir cada categoria a partir de un json
      List<CursoModelo> cursos =
          data.map((json) => CursoModelo.fromJson(json)).toList();

      return cursos;
    } on DioException catch (dioError) {
      print('>>>>>>>>>>>>>Excepcion dio: ${dioError.message}');
      if (dioError.type == DioExceptionType.connectionTimeout) {
        throw Exception('>>>>>>>>>>>>>>>>Connection Timeout Exception');
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw Exception('>>>>>>>>>>>>>>>>>Receive Timeout Exception');
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw Exception(
            '>>>>>>>>>>>>>>>>>>>Received invalid status code: ${dioError.response?.statusCode}');
      } else {
        throw Exception(
            '>>>>>>>>>>>>>>>>Unexpected error: ${dioError.message}');
      }
    } catch (e) {
      //TODO: manejar cualquier otro error, si no se ha cargado la informacion no se puede continuar con la aplicacion, sugerir soporte tecnico
      print('error: $e');
      //TODO: error fatal, en este caso no se puede continuar con la ejecucion, direccionar a una vista de error y sugerir comunicacion con el soporte
      return Future.value(null);
    }
  }

  @override
  Future<RespuestaModelo> agregarCurso(CursoModelo curso) {
    // TODO: implement agregarCurso
    throw UnimplementedError();
  }

  @override
  Future<RespuestaModelo> eliminarCurso(CursoModelo curso) {
    // TODO: implement eliminarCurso
    throw UnimplementedError();
  }

  @override
  Future<RespuestaModelo> enconcontrarCursosDe(String tituloCategoria) {
    // TODO: implement enconcontrarCursosDe
    throw UnimplementedError();
  }

  @override
  Future<RespuestaModelo> encontrarTodosCursos() {
    // TODO: implement encontrarTodosCursos
    throw UnimplementedError();
  }
}
