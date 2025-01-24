import 'package:movil/config/configServicio.dart';
import 'package:movil/data/api/cliente/categoriaClienteAbstracto.dart';
import 'package:movil/data/api/cliente/cursoClienteAbstracto.dart';
import 'package:movil/data/api/fabrica/clienteLocalFabrica.dart';
import 'package:movil/data/api/fabrica/clienteRemotoFabrica.dart';

abstract class ClienteFabricaAbstracta {
  static final String SERVICIO_REMOTO = 'remoto';
  static final String SERVICIO_LOCAL = 'local';
  CategoriaClienteAbstracto crearClienteCategoria();
  CursoClienteAbstracto crearClienteCurso();

  static ClienteFabricaAbstracta obtenerClienteFabrica() {
    if (ConfigServicio.tipoFabricaServicio == SERVICIO_LOCAL) {
      return ClienteLocalFabrica();
    }
    if (ConfigServicio.tipoFabricaServicio == SERVICIO_REMOTO) {
      return ClienteRemotoFabrica();
    }
    return ClienteLocalFabrica();
  }
}
