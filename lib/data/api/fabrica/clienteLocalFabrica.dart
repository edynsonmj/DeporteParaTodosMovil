import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/api/cliente/cursoClienteAbstracto.dart';
import 'package:movil/data/api/fabrica/clienteFabricaAbstracta.dart';
import 'package:movil/data/api/cliente/local/categoriaClienteLocal.dart';
import 'package:movil/data/api/cliente/local/cursoClienteLocal.dart';

class ClienteLocalFabrica implements ClienteFabricaAbstracta {
  @override
  CategoriaClienteAbstracto crearClienteCategoria() {
    return CategoriaClienteLocal();
  }

  @override
  CursoClienteAbstracto crearClienteCurso() {
    // TODO: implement crearClienteCurso
    return CursoClienteLocal();
  }
}
