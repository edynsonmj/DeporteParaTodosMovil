//TODO: construir contrato (interface) que sea implementado por un repositorio
import 'package:movil/data/models/imagenModelo.dart';
import 'package:movil/data/sources/remote/mock/CategoriaServicio.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';

class CategoriaRepositorio {
  final CategoriaServicio servicio;
  CategoriaRepositorio(this.servicio);

  Future<List<CategoriaEntidad>> obtenerCategorias() async {
    //obtener lista del servicio
    final categoriasModelo = await servicio.obtenerCategorias();
    //retornar y mapear de modelo a entidad
    return categoriasModelo
        .map((modelo) => CategoriaEntidad(
            titulo: modelo.titulo,
            descripcion: modelo.descripcion,
            //considerar si la imagen es nula
            imagen: (modelo.imagen != null)
                //si no es nulla asignar objeto
                ? (ImagenEntidad(
                    id: modelo.imagen!.id,
                    nombre: modelo.imagen!.nombre,
                    tipoArchivo: modelo.imagen!.tipoArchivo,
                    longitud: modelo.imagen!.longitud,
                    datos: modelo.imagen!.datos))
                //si es nula asignar null
                : null))
        .toList();
  }
}
