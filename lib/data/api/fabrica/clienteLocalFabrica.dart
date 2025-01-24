import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';

class ClienteLocalFabrica implements ClienteFabricaAbstracta {
  @override
  CategoriaClienteAbstracto crearClienteCategoria() {
    throw UnimplementedError();
  }
}
