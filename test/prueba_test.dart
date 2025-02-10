import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:movil/config/configServicio.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCategoriaRemota.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/errorModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/data/repositories/categoriaRepositorio.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'dart:math';

import 'package:movil/domain/entities/imagenEntidad.dart';

void main() {
  CategoriaRepositorio repositorio;

    ConfigServicio.tipoFabricaServicio = ConexionFabricaAbstracta.SERVICIO_REMOTO;
    ConfigServicio.ip = '192.168.100.66';
    repositorio =
        CategoriaRepositorio(cliente: ConexionCategoriaRemota());
    group('Insertar Categoria:', (){
      Random random = Random();
      prueba1(random, repositorio);
      prueba2(random, repositorio);
      prueba3(random, repositorio);
      prueba4(random, repositorio);
    });
}
void prueba1(Random random, CategoriaRepositorio repositorio){
  test('Error al guardar sin imagen', () async{
    String titulo = 'nombre ${random.nextInt(1000)}';
    String descripcion = 'descripcion ${random.nextInt(1000)}';

    CategoriaEntidad entidad = CategoriaEntidad(titulo: titulo, descripcion: descripcion);

    RespuestaModelo respuesta = await repositorio.insertarCategoria(entidad);
    imprimirRespuesta(respuesta);
    expect(respuesta.codigoHttp, 400);
    expect(respuesta.error, isA<ErrorModelo>());
  });
}

prueba2(Random random, CategoriaRepositorio repositorio){
  test('Exito, todos los campos requeridos', () async{
    String titulo = 'nombre ${random.nextInt(1000)}';
    String descripcion = 'descripcion ${random.nextInt(1000)}';
    File imagen = File('assets/images/1.jpg');
    CategoriaEntidad entidad = CategoriaEntidad(titulo: titulo, descripcion: descripcion);
    entidad.imagenFile = imagen;
    RespuestaModelo respuesta = await repositorio.insertarCategoria(entidad);
    imprimirRespuesta(respuesta);
    expect(respuesta.codigoHttp, 201);
  });
}

prueba3(Random random, CategoriaRepositorio repositorio){
  test('Error, sin titulo', () async{
    String titulo = '';
    String descripcion = 'descripcion ${random.nextInt(1000)}';
    File imagen = File('assets/images/1.jpg');
    CategoriaEntidad entidad = CategoriaEntidad(titulo: titulo, descripcion: descripcion);
    entidad.imagenFile = imagen;
    RespuestaModelo respuesta = await repositorio.insertarCategoria(entidad);
    imprimirRespuesta(respuesta);
    expect(respuesta.codigoHttp, 400);
  });
}

prueba4(Random random, CategoriaRepositorio repositorio){
  test('Error, sin descripcion', () async{
    String titulo = 'nombre ${random.nextInt(1000)}';
    String descripcion = '';
    File imagen = File('assets/images/1.jpg');
    CategoriaEntidad entidad = CategoriaEntidad(titulo: titulo, descripcion: descripcion);
    entidad.imagenFile = imagen;
    RespuestaModelo respuesta = await repositorio.insertarCategoria(entidad);
    imprimirRespuesta(respuesta);
    expect(respuesta.codigoHttp, 400);
  });
}

prueba5(Random random, CategoriaRepositorio repositorio){
  test('Error, sin descripcion', () async{
    String titulo = 'nombre ${random.nextInt(1000)}';
    String descripcion = '';
    File imagen = File('assets/images/1.jpg');
    CategoriaEntidad entidad = CategoriaEntidad(titulo: titulo, descripcion: descripcion);
    entidad.imagenFile = imagen;
    RespuestaModelo respuesta = await repositorio.insertarCategoria(entidad);
    imprimirRespuesta(respuesta);
    expect(respuesta.codigoHttp, 400);
  });
}

void imprimirRespuesta(RespuestaModelo respuesta){
  print('codigo: ${respuesta.codigoHttp}');
  if(respuesta.datos!=null){
    imprimirDatos(respuesta.datos);
  }
  if(respuesta.error!=null){
    imprimirError(respuesta.error!);
  }
}
void imprimirDatos(dynamic datos){
  print('datos tipo: ${datos.runtimeType}');
  CategoriaEntidad entidad = datos as CategoriaEntidad;
  print('datos string: ${entidad.titulo}');
  print('datos string: ${entidad.descripcion}');
  if(datos.imagen!=null){
    imprimirImagen(datos.imagen!);
  }
}
void imprimirImagen(ImagenEntidad imagen){
  print('image id: ${imagen.id}');
  print('imagen nombre: ${imagen.nombre}');
}
void imprimirError(ErrorModelo error){
  print('error codigo: ${error.codigoHttp}');
  print('error mensaje: ${error.mensaje}');
  print('error metodo: ${error.metodo}');
  print('error url: ${error.url}');
}
