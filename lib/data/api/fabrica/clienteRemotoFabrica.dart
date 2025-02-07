import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/api/cliente/cursoClienteAbstracto.dart';
import 'package:movil/data/api/cliente/remoto/categoriaCliente.dart';
import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';
import 'package:movil/data/api/cliente/remoto/cursoCliente.dart';

class ClienteRemotoFabrica implements ClienteFabricaAbstracta {
  @override
  CategoriaClienteAbstracto crearClienteCategoria() {
    return CategoriaCliente();
  }

  @override
  CursoClienteAbstracto crearClienteCurso() {
    return CursoCliente();
  }
}
