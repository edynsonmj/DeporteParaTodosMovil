import 'package:movil/data/api/conexion/ConexionCategoria.dart';
import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/api/conexion/local/ConexionCursoLocal.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/api/conexion/local/ConexionCategoriaLocal.dart';

class ConexionLocalFabrica implements ConexionFabricaAbstracta {
  @override
  ConexionCategoria crearConexionCategoria() {
    return ConexionCategoriaLocal();
  }

  @override
  ConexionCurso crearConexionCurso() {
    return ConexionCursoLocal();
  }
}
