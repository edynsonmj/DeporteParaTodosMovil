import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaEntidad {
  final String? id;
  final String titulo;
  final String descripcion;
  final ImagenEntidad? imagen;

  CategoriaEntidad(
      {this.id, required this.titulo, required this.descripcion, this.imagen});

  factory CategoriaEntidad.fromJson(dynamic json) {
    return CategoriaEntidad(
        titulo: json['titulo'],
        descripcion: json['descripcion'],
        imagen: ((json['imagen'] != null)
            ? ImagenEntidad.fromJson(json['imagen'])
            : null));
  }
}
