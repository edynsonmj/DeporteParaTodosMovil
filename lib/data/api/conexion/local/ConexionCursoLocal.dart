import 'dart:convert';

import 'package:movil/data/api/conexion/ConexionCurso.dart';
import 'package:movil/data/models/cursoModelo.dart';

class ConexionCursoLocal implements ConexionCurso {
  String data = '''
  [
    {
        "nombreCurso": "Futbol masculino",
        "nombreDeporte": "Futbol",
        "tituloCategoria": "Recreativo",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Futbol femenino",
        "nombreDeporte": "Futbol",
        "tituloCategoria": "Semillero",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Baloncesto",
        "nombreDeporte": "Baloncesto",
        "tituloCategoria": "Seleccionado",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Natacion Nivel 1",
        "nombreDeporte": "Natacion",
        "tituloCategoria": "Recreativo",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Karate nivel 1",
        "nombreDeporte": "Karate",
        "tituloCategoria": "Recreativo",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Karate nivel 3",
        "nombreDeporte": "Karate",
        "tituloCategoria": "Semillero",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    },
    {
        "nombreCurso": "Boxeo Masculino",
        "nombreDeporte": "Boxeo",
        "tituloCategoria": "Seleccionado",
        "descripcion": "Nisi Lorem aliquip quis consequat. Excepteur laborum qui sit sunt proident. Labore laboris id veniam pariatur excepteur qui. Sit elit qui irure irure commodo consequat fugiat minim ea proident. Dolore incididunt enim cillum ad aliquip esse anim mollit ipsum occaecat officia fugiat enim. Ut aute dolore mollit dolore duis elit proident quis officia Lorem minim. Labore laboris reprehenderit occaecat aliqua sit ullamco ad est.",
        "imagen": null
    }
  ]''';
  @override
  Future<List<CursoModelo>> obtenerCursos() {
    List<dynamic> jsonData = jsonDecode(data);
    List<CursoModelo> cursos =
        jsonData.map((json) => CursoModelo.fromJson(json)).toList();
    return Future.value(cursos);
  }
}
