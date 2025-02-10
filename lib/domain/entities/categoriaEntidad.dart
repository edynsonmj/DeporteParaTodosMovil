import 'dart:io';

import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaEntidad {
  final String? id;
  final String titulo;
  final String descripcion;
  ImagenEntidad? imagen;
  File? imagenFile;

  CategoriaEntidad(
      {this.id, required this.titulo, required this.descripcion, this.imagen, this.imagenFile});

  factory CategoriaEntidad.fromJson(dynamic json) {
    return CategoriaEntidad(
        titulo: json['titulo'],
        descripcion: json['descripcion'],
        imagenFile: (json['imagenFile']!=null)
            ?json['imagenFile']
            :null,
        imagen: ((json['imagen'] != null)
            ? ImagenEntidad.fromJson(json['imagen'])
            : null));
  }
}
