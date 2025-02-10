//TODO: construir contrato (interface) que sea implementado por un repositorio
import 'dart:typed_data';

import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/imagenModelo.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCategoriaRemota.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaRepositorio {
  ConexionCategoria cliente;
  CategoriaRepositorio({required this.cliente});

  Future<List<CategoriaEntidad>> obtenerCategorias() async {
    //obtener lista del servicio
    final categoriasModelo = await cliente.obtenerCategorias();
    //retornar y mapear de modelo a entidad
    return categoriasModelo
        .map((modelo) => CategoriaEntidad(
            titulo: modelo.titulo,
            descripcion: modelo.descripcion,
            //considerar si la imagen es nula
            imagen: (modelo.imagen != null)
                //si no es nulla asignar objeto
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

  Future<RespuestaModelo> insertarCategoria(CategoriaEntidad entidad) async{
    categoriaModelo modeloPeticion = categoriaModelo(titulo: entidad.titulo, descripcion: entidad.descripcion);
    CategoriaEntidad entidadRespuesta;
    if(entidad.imagenFile!=null){
      modeloPeticion.imagenFile = entidad.imagenFile;
    }

    final RespuestaModelo respuesta= await cliente.guardarCategoria(modeloPeticion);

    //transformar los datos para que puedan ser manejados apropiadamente.
    if(respuesta.codigoHttp==201){
      if(respuesta.datos==null){
        //a travez del codigo informamos que no hay datos pero la peticion fue correcta
        respuesta.codigoHttp=204;
        return respuesta;
      }
      categoriaModelo modelo = respuesta.datos as categoriaModelo;
      entidadRespuesta = CategoriaEntidad(
          titulo: modelo.titulo,
          descripcion: modelo.descripcion
      );
      if(modelo.imagen!=null){
        ImagenModelo img = modelo.imagen!;
        entidadRespuesta.imagen = ImagenEntidad(
            nombre: img.nombre,
            tipoArchivo: img.tipoArchivo,
            longitud: img.longitud,
            datos: img.convertirDeBase64());
      }
      //escribo los datos transformados
      respuesta.datos = entidadRespuesta;
    }
    return respuesta;
  }
}
