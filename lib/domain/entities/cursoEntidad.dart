import 'package:movil/data/models/cursoModelo.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CursoEntidad {
  final String nombreCurso;
  final String nombreDeporte;
  final String tituloCategoria;
  final String descripcion;
  final ImagenEntidad? imagen;

  CursoEntidad(
      {required this.nombreCurso,
      required this.nombreDeporte,
      required this.tituloCategoria,
      required this.descripcion,
      this.imagen});

  factory CursoEntidad.fromModelo(CursoModelo modelo) {
    ImagenEntidad? imagen;
    if (modelo.imagen != null) {
      imagen = ImagenEntidad.fromModelo(modelo.imagen!);
    }
    return CursoEntidad(
        nombreCurso: modelo.nombreCurso,
        nombreDeporte: modelo.nombreDeporte,
        tituloCategoria: modelo.tituloCategoria,
        descripcion: modelo.descripcion,
        imagen: imagen);
  }
}
