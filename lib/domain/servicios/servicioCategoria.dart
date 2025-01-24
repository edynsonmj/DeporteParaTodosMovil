import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';
import 'package:movil/data/repositories/categoriaRepositorio.dart';
import 'package:movil/data/api/remoto/categoriaCliente.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';

class ServicioCategoria {
  CategoriaRepositorio repositorio;

  ServicioCategoria()
      : repositorio = CategoriaRepositorio(
            cliente: ClienteFabricaAbstracta.obtenerClienteFabrica()
                .crearClienteCategoria());

  Future<List<CategoriaEntidad>> call() async {
    print(repositorio.toString());
    return await repositorio.obtenerCategorias();
  }
}
