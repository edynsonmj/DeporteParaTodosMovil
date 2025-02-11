import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:movil/config/configServicio.dart';
import 'package:movil/data/api/conexion/remoto/ConexionCategoriaRemota.dart';
import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/data/models/errorModelo.dart';
import 'package:movil/data/models/respuestaModelo.dart';
import 'package:movil/data/repositories/categoriaRepositorio.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'dart:math';

import 'package:movil/domain/entities/imagenEntidad.dart';

import 'insertarCategoriaTest.dart';
import 'listarCategoriaTest.dart';

void main() {
  CategoriaRepositorio repositorio;

    ConfigServicio.tipoFabricaServicio = ConexionFabricaAbstracta.SERVICIO_REMOTO;
    ConfigServicio.ip = '192.168.100.66';

    repositorio =
        CategoriaRepositorio(cliente: ConexionCategoriaRemota());

    group('Insertar Categoria:', (){
      Random random = Random();
      InsertarCategoriaTest test =  InsertarCategoriaTest();
      test.prueba1(random, repositorio);
      test.prueba2Exito(random, repositorio);
      test.prueba3(random, repositorio);
      test.prueba4(random, repositorio);
      test.prueba5(random, repositorio);
    });
    group('Obtener Categoria:', (){
      ListarCategoriaTest test = ListarCategoriaTest();
      test.prueba1codigo200(repositorio);
      test.prueba2codigo204(repositorio);
    });
}
