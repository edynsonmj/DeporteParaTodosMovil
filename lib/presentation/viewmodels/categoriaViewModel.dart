import 'package:flutter/material.dart';
import 'package:movil/config/routes/app_rutas.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/servicios/servicioCategoria.dart';
import 'package:movil/presentation/view/widgets/dialogCargando.dart';
import 'package:movil/presentation/view/widgets/dialogError.dart';
import 'package:movil/presentation/view/widgets/dialogExito.dart';

class CategoriaViewModel with ChangeNotifier {
  //servicio en uso
  final ServicioCategoria servicioCategoria;

  //lista de categorias, privada.
  List<CategoriaEntidad>? _categorias;
  //get para manipulacion de la lista fuera del viewModel.
  List<CategoriaEntidad>? get categorias => _categorias;

  //lista entradas
  List<DropdownMenuEntry> _listaEntradas = [];
  //
  List<DropdownMenuEntry> get getListaEntradas => _listaEntradas;
  //constructor
  CategoriaViewModel() : servicioCategoria = ServicioCategoria();

  Future<void> fetchCategorias() async {
    try {
      _categorias = await servicioCategoria.call();
      _cargarEntradas();
      notifyListeners();
    } catch (e) {
      //TODO: manejar error
      print(e);
    }
  }

  guardarCategoria(CategoriaEntidad entidad, context) async{
      RespuestaModelo? respuesta;
    try{
      respuesta = await servicioCategoria.insertarCategoria(entidad);
      print('respuesta: ${respuesta.toString()}');
      Navigator.of(context).pop();
    }catch(e){
      showDialog(context: context, builder: (context){
        return DialogError(titulo: 'error en catch', mensaje: e.toString(), codigo: -1);
      });
    }
    if(respuesta!=null){
      if(respuesta.codigoHttp==201){
        showDialog(context: context,barrierDismissible: false, builder: (context){
          return DialogExito(titulo: 'Accion exitosa', mensaje: 'La categoria ${entidad.titulo}, ha sido creada con exito');
        });
      }

      showDialog(context: context, barrierDismissible: false, builder: (context){
        return DialogError(
          titulo: 'Error al insertar la categoria',
          codigo: respuesta?.codigoHttp?? -1,
          mensaje: respuesta?.error?.mensaje?? 'No se ha encontrado informacion del error',
        );
      });
    }
  }

  void _cargarEntradas() {
    if (_categorias != null && _categorias!.isNotEmpty) {
      _listaEntradas = _categorias!.map((categoria) {
        return DropdownMenuEntry(
            value: categoria.titulo, label: categoria.titulo);
      }).toList();
    } else {
      _listaEntradas = [];
    }
  }
}
