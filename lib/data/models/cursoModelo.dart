import 'package:movil/data/models/imagenModelo.dart';

class CursoModelo {
  final String nombreCurso;
  final String nombreDeporte;
  final String tituloCategoria;
  final String descripcion;
  final ImagenModelo? imagen;

  CursoModelo(
      {required this.nombreCurso,
      required this.nombreDeporte,
      required this.tituloCategoria,
      required this.descripcion,
      this.imagen});

  factory CursoModelo.fromJson(dynamic json) {
    return CursoModelo(
        nombreCurso: json['nombreCurso'],
        nombreDeporte: json['nombreDeporte'],
        tituloCategoria: json['tituloCategoria'],
        descripcion: json['descripcion'],
        imagen: ((json['imagen'] != null)
            ? ImagenModelo.fromJson(json['imagen'])
            : (null)));
  }
}
