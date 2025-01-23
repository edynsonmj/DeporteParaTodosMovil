import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaEntidad {
  final String? id;
  final String titulo;
  final String descripcion;
  final ImagenEntidad? imagen;

  CategoriaEntidad(
      {this.id, required this.titulo, required this.descripcion, this.imagen});
}
