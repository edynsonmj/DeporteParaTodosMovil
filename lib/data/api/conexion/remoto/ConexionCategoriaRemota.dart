import 'package:dio/dio.dart';
import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/config/configServicio.dart';

class ConexionCategoriaRemota implements ConexionCategoria {
  final _dio = Dio(
      BaseOptions(baseUrl: ConfigServicio().obtenerBaseApi())
  );

  @override
  Future<List<categoriaModelo>> obtenerCategorias() async {
    Response response;
    //intentar hacer la peticion
    try {
      print('esto es la base url: '+_dio.options.baseUrl);
      response = await _dio.get(
          '/categorias'
      );
      print('este es la direccion accedida ${response.realUri}');

      //se espera codigo 200 para la peticion, si no manejar error
      if (response.statusCode != 200) {
        //TODO: no se ha sido exitosa la carga de informacion, manejar error
        return Future.value(null);
      }

      //el response data para este caso retorna una lista de categorias
      //tener en cuenta que la estructura puede cambiar
      List<dynamic> data = response.data;

      //se construye la lista segun el modelo, para ello se usa factory para construir cada categoria a partir de un json
      List<categoriaModelo> categorias =
          data.map((json) => categoriaModelo.fromJson(json)).toList();

      return categorias;
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
  Future<categoriaModelo> guardarCategoria(categoriaModelo datos) {
    // TODO: implement guardarCategoria
    throw UnimplementedError();
  }
}
