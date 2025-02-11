import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/imagenModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';

class ConexionCategoriaLocal implements ConexionCategoria {
  final List<categoriaModelo> _base = [
    categoriaModelo(
        titulo: "Seleccionado",
        descripcion:
            "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        imagen: null),
    categoriaModelo(
        titulo: "Semillero",
        descripcion:
            "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        imagen: null),
    categoriaModelo(
        titulo: "Recreativo",
        descripcion:
            "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        imagen: null)
  ];
  @override
  Future<List<categoriaModelo>> obtenerCategorias() async {
    return await Future.value(_base);
  }

  @override
  Future<RespuestaModelo> guardarCategoria(categoriaModelo categoria) {
    // TODO: implement guardarCategoria
    throw UnimplementedError();
  }

  @override
  Future<RespuestaModelo> encontrarCategorias() {
    // TODO: implement encontrarCategorias
    throw UnimplementedError();
  }
}
