import 'dart:typed_data';

class ImagenModelo {
  final int? id;
  final String nombre;
  final String tipoArchivo;
  final int longitud;
  final String datos;

  ImagenModelo({
    this.id,
    required this.nombre,
    required this.tipoArchivo,
    required this.longitud,
    required this.datos,
  });

  factory ImagenModelo.fromJson(dynamic json) {
    return ImagenModelo(
        id: json['id'],
        nombre: json['nombre'],
        tipoArchivo: json['tipoArchivo'],
        longitud: json['longitud'],
        datos: json['datos']);
  }
}
