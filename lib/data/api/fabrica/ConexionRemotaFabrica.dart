import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCategoriaRemota.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCursoRemoto.dart';

class ConexionRemotaFabrica implements ConexionFabricaAbstracta {
  @override
  ConexionCategoria crearConexionCategoria() {
    return ConexionCategoriaRemota();
  }

  @override
  ConexionCurso crearConexionCurso() {
    return ConexionCursoRemoto();
  }
}
