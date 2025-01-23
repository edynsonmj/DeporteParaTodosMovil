import 'package:movil/data/models/imagenModelo.dart';

class categoriaModelo {
  final String titulo;
  final String descripcion;
  final ImagenModelo? imagen;

  categoriaModelo(
      {required this.titulo, required this.descripcion, this.imagen});

  factory categoriaModelo.fromJson(dynamic json) {
    return categoriaModelo(
        titulo: json['titulo'],
        descripcion: json['descripcion'],
        imagen: ((json['objImagen'] != null)
            ? ImagenModelo.fromJson(json['objImagen'])
            : (null)));
  }

  dynamic toJson() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'imagen': imagen,
    };
  }
}
