import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/errorModelo.dart';
import 'package:movil/data/models/imagenModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';

class ConexionCategoriaLocal implements ConexionCategoria {
  final List<categoriaModelo> _base = [
    categoriaModelo(
        titulo: 'Categoria prueba',
        descripcion: 'descripcion de la categoria de prueba'),
  ];
  @override
  Future<RespuestaModelo> guardarCategoria(categoriaModelo categoria) async {
    late ImagenModelo imagen;
    //si la imagen ha sido cargada para la prueba la adjunto al tipo de retorno, que es en base 64
    if (categoria.imagenFile != null) {
      File file = categoria.imagenFile!;
      String nombre = file.path.split('/').last;
      String? tipoArchivo = lookupMimeType(file.path);
      int longitud = await file.length();
      List<int> bytes = await file.readAsBytes();
      String datos = base64Encode(bytes);
      imagen = ImagenModelo(
          nombre: nombre,
          tipoArchivo: tipoArchivo ?? '',
          longitud: longitud,
          datos: datos);
    }
    //lleno los datos en un tipo de dato que responde el servicio
    categoriaModelo modelo = categoriaModelo(
        titulo: categoria.titulo,
        descripcion: categoria.descripcion,
        imagen: imagen);
    //la adiciono a la lista para conservar y probar
    _base.add(modelo);
    // respondo
    return await Future.value(RespuestaModelo(
      codigoHttp: 201,
      datos: modelo,
      error: null,
    ));
  }

  @override
  Future<RespuestaModelo> encontrarCategorias() async {
    if (_base.isEmpty) {
      return await Future.value(RespuestaModelo(
          codigoHttp: 204,
          datos: _base,
          error: ErrorModelo(
              codigoHttp: 204,
              mensaje: 'Lastimosamente no hay datos a cargar',
              url: 'Mock/categorias',
              metodo: 'GET')));
    }
    return await Future.value(
        RespuestaModelo(codigoHttp: 200, datos: _base, error: null));
  }

  @override
  Future<RespuestaModelo> eliminarCategoria(String titulo) {
    String metodo = 'DELETE';
    String url = 'mock/categoria/$titulo';
    categoriaModelo? categoria;

    late RespuestaModelo respuesta;
    for (categoriaModelo item in _base) {
      if (item.titulo == titulo) {
        categoria = item;
        _base.remove(item);
        break;
      }
    }
    if (categoria == null) {
      respuesta = RespuestaModelo(
          codigoHttp: 404,
          datos: null,
          error: ErrorModelo(
              codigoHttp: 404,
              mensaje:
                  'No se ha encontrado el elemento a eliminar que se buscaba eliminar',
              url: url,
              metodo: metodo));
      return Future.value(respuesta);
    }
    respuesta = RespuestaModelo(
      codigoHttp: 200,
      datos: categoria,
      error: null,
    );
    return Future.value(respuesta);
  }
}
