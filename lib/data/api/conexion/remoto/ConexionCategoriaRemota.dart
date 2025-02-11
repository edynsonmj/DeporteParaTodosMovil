import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/config/configServicio.dart';
import 'package:movil/data/models/errorModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';

class ConexionCategoriaRemota implements ConexionCategoria {
  final _dio = Dio(
      BaseOptions(
          baseUrl: ConfigServicio().obtenerBaseApi(),
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          sendTimeout: Duration(seconds: 10)
      )
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
  Future<RespuestaModelo> encontrarCategorias() async{
    final String metodo = 'GET';
    try{
      final response = await _dio.get('/categorias');
      //si el codigo no es 200, generar respuesta segun el codigo recibido
      if(response.statusCode!=200){
        return RespuestaModelo.fromResponse(response, metodo);
      }
      //Si el retorno es ua lista, es el caso de exito, transformar y retornar
      if(response.data is List){
        List<dynamic> lista = response.data;
        List<categoriaModelo> categorias = [];
        for(var item in lista){
          categoriaModelo categoria = categoriaModelo.fromJson(item);
          categorias.add(categoria);
        }
        return RespuestaModelo(
            codigoHttp: response.statusCode==null? 200: response.statusCode!,
            datos: categorias);
      }

      //Debido a que no se esta retornando el codigo 204 cuando la lista esta vacia
      //entonces se hace la siguiente validacion
      //retirar pieza de codigo si se soluciona en el back
      //esto significa que se ha retornado pero no una lista.
      if(response.statusCode==200){
        return RespuestaModelo(
          codigoHttp: 204,
          datos: null,
          error: ErrorModelo(
            codigoHttp: 204,
            mensaje: 'La lista de categorias se encuentra vacia',
            metodo: metodo,
            url: response.realUri.toString()
          )
        );
      }

      //la peticion no ha fallado, pero la respuesta no es correcta
      //generar respuesta segun los resultado del response
      return RespuestaModelo.fromResponse(response, metodo);

    }on DioException catch(excepcion){
      return RespuestaModelo.fromDioException(excepcion, metodo);
    }on Exception catch(exc){
      return RespuestaModelo(
          codigoHttp: 0,
          datos: null,
          error: ErrorModelo(codigoHttp: 0, mensaje: 'Error fuera de la conexion: ${exc.toString()}', url: '', metodo: metodo)
      );
    }
    return Future.value(null);
  }

  @override
  Future<RespuestaModelo> guardarCategoria(categoriaModelo datos) async{
    final String metodo = 'POST';
    late String tipoMime;
    if(datos.imagenFile!=null){
      tipoMime = lookupMimeType(datos.imagenFile!.path)!;
    }
    //Se crea el formData a enviar
    FormData formData = FormData.fromMap({
      'titulo': datos.titulo,
      'descripcion': datos.descripcion,
      'imagen': (datos.imagenFile!=null)
          ? (await MultipartFile.fromFile(
          datos.imagenFile!.path,
          filename: datos.imagenFile!.path.split('/').last, 
          contentType: DioMediaType.parse(tipoMime)))
          :''
      ,
    });
    try{
      //se hace la peticion con el formdata
      final response = await _dio.post(
        '/categoriass',
        data:formData
      );
      //Si hay error se retorna una respuesta segun el codigo
      if(response.statusCode!=201){
        RespuestaModelo.fromResponse(response, metodo);
      }
      //exito en la peticion
      return RespuestaModelo(
        codigoHttp: response.statusCode!,
        error: null,
        datos: categoriaModelo.fromJson(response.data)
      );
    }on DioException catch(dioExc){
      //Se ha generado un error en la peticion, generar respuesta segun tipo de excepcion
      return RespuestaModelo.fromDioException(dioExc, metodo);
    }on Exception catch(exc){
      //se ha generado un error desconocido
      return RespuestaModelo(
        codigoHttp: 0,
        datos: null,
        error: ErrorModelo(codigoHttp: 0, mensaje: 'Error fuera de la conexion: ${exc.toString()}', url: '', metodo: metodo)
      );
    }
  }
}
