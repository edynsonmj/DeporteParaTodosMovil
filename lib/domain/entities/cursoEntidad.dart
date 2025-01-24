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
}
