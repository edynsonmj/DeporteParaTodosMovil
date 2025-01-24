//TODO: construir contrato (interface) que sea implementado por un repositorio
import 'dart:typed_data';

import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/models/imagenModelo.dart';
import 'package:movil/data/api/remoto/categoriaCliente.dart';
import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaRepositorio {
  CategoriaClienteAbstracto cliente;
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
}
