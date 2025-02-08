import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';

class CategoriaFormulario extends StatefulWidget {
  final CategoriaEntidad? categoria;

  CategoriaFormulario({super.key, this.categoria});

  @override
  State<StatefulWidget> createState() {
    return _CategoriaFormularioState();
  }
}

class _CategoriaFormularioState extends State<CategoriaFormulario> {
  CategoriaEntidad? _categoria;
  File? _imagen;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imagen = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _categoria = widget.categoria;
    return Scaffold(
      appBar: Bar(
          title:
              '${(_categoria == null) ? "Insertar Categoria" : "Editar " + (_categoria!.titulo)}'),
      drawer: Menulateral(),
      body: contenedorSeguro(context),
    );
  }

  Widget contenedorSeguro(BuildContext context) {
    return SafeArea(child: contenido());
  }

  Widget contenido() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: SingleChildScrollView(
            child: Form(
                child: Column(
          children: [
            TextFormField(
              initialValue: (_categoria != null) ? _categoria!.titulo : null,
              decoration: InputDecoration(label: Text('Titulo')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa titulo de la categoria, por favor';
                }
              },
            ),
            TextFormField(
              maxLines: 10,
              minLines: 1,
              initialValue:
                  (_categoria != null) ? _categoria!.descripcion : null,
              decoration: InputDecoration(label: Text('Descripcion')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa titulo de la categoria, por favor';
                }
              },
            ),
            _imagen == null
                ? Text('No se ha seleccionado ninguna imagen.')
                : Image.file(_imagen!),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Seleccionar Imagen'),
            ),
          ],
        ))));
  }
}
