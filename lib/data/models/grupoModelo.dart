import 'package:movil/data/models/imagenModelo.dart';

class GrupoModelo {
  String nombre;
  int anio;
  int iterable;
  ImagenModelo? imagen;
  int cupos;
  String estado;
  String fechaCreacion;
  String? fechaFinalizacion;

  GrupoModelo({
    required this.nombre,
    required this.anio,
    required this.iterable,
    this.imagen,
    required this.cupos,
    required this.estado,
    required this.fechaCreacion,
    this.fechaFinalizacion,
  });

  factory GrupoModelo.fromJson(dynamic json) {
    return GrupoModelo(
        nombre: json['nombre'],
        anio: json['anio'],
        iterable: json['iterable'],
        cupos: json['cupos'],
        estado: json['estado'],
        fechaCreacion: json['fechaCreacion'],
        imagen: ((json['imagen'] != null)
            ? ImagenModelo.fromJson(json['imagen'])
            : null),
        fechaFinalizacion: (json['fechaFinalizacion'] != null)
            ? json['fechaFinalizacion']
            : null);
  }
}
