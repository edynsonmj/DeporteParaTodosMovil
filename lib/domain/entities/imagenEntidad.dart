class ImagenEntidad {
  final int? id;
  final String nombre;
  final String tipoArchivo;
  final int longitud;
  final String datos;

  ImagenEntidad(
      {this.id,
      required this.nombre,
      required this.tipoArchivo,
      required this.longitud,
      required this.datos});
}
