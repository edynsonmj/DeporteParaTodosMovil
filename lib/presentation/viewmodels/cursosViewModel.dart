import 'package:flutter/material.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/domain/entities/cursoEntidad.dart';
import 'package:movil/domain/servicios/servicioCurso.dart';
import 'package:movil/presentation/view/widgets/dialogError.dart';

class CursosViewModel with ChangeNotifier {
  //servicio a usar
  final ServicioCurso servicioCurso;
  //lista de cursos
  List<CursoEntidad>? _listaCursos;
  //lista entradas para el desplegable
  List<DropdownMenuEntry> _listaEntradas = [];
  //get para acceder a la lista
  List<CursoEntidad>? get getListaCursos => _listaCursos;
  //get para acceder a la lista de entradas para el desplegable
  List<DropdownMenuEntry> get getListaEntradas => _listaEntradas;

  //constructor
  CursosViewModel() : servicioCurso = ServicioCurso();

  Future<void> cargarListaCursos() async {
    try {
      _listaCursos = await servicioCurso.call();
      _cargarEntradas();
      notifyListeners();
    } catch (e) {
      print('error en CursosViewModel: $e');
    }
  }

  Future<void> listarTodosCursos(context) async {
    RespuestaModelo? respuesta;
    _listaCursos = [];
    try {
      respuesta = await servicioCurso.listarTodosCursos();
      switch (respuesta.codigoHttp) {
        case 200: // respuesta correcta, cargar datos
          if (respuesta.datos is List<CursoEntidad>) {
            _listaCursos = respuesta.datos as List<CursoEntidad>;
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogError(
                      titulo: 'datos inconsistentes',
                      mensaje:
                          'no se ha obtenido una lista de tipo entidad para cargar los datos',
                      codigo: 0);
                });
          }
          break;
        case 204: //listado vacio
          showDialog(
              context: context,
              builder: (context) {
                return DialogError(
                    titulo: 'Exito en la operacion',
                    mensaje:
                        'Lastimosamente no se encontraron categorias en el sistema',
                    codigo: 204);
              });
          break;
        default: //Otro tipo de error reportado
          showDialog(
              context: context,
              builder: (context) {
                return DialogError(
                    titulo: 'No se pudo obtener datos',
                    mensaje: respuesta?.error?.mensaje ??
                        'no hay informacion respecto al error',
                    codigo: respuesta?.codigoHttp ?? 0);
              });
          break;
      }
    } catch (e) {
      //error no esperado
      showDialog(
          context: context,
          builder: (context) {
            return DialogError(
                titulo: 'excepcion no controlada',
                mensaje: e.toString(),
                codigo: 0);
          });
    } finally {
      _cargarEntradas();
      notifyListeners();
    }
  }

  void _cargarEntradas() {
    if (_listaCursos != null && _listaCursos!.isNotEmpty) {
      _listaEntradas = _listaCursos!.map((curso) {
        return DropdownMenuEntry(
            value: curso.nombreCurso, label: curso.nombreCurso);
      }).toList();
    } else {
      _listaEntradas = [];
    }
  }
}
