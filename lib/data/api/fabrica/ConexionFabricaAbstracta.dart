import 'package:movil/config/configServicio.dart';
import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/api/fabrica/ConexionRemotaFabrica.dart';
import 'package:movil/data/api/fabrica/ConexionLocalFabrica.dart';

abstract class ConexionFabricaAbstracta {
  static final String SERVICIO_REMOTO = 'remoto';
  static final String SERVICIO_LOCAL = 'local';

  static ConexionFabricaAbstracta obtenerConexionFabrica() {
    if (ConfigServicio.tipoFabricaServicio == SERVICIO_LOCAL) {
      return ConexionLocalFabrica();
    }
    if (ConfigServicio.tipoFabricaServicio == SERVICIO_REMOTO) {
      return ConexionRemotaFabrica();
    }
    return ConexionLocalFabrica();
  }

  ConexionCategoria crearConexionCategoria();
  ConexionCurso crearConexionCurso();
}
