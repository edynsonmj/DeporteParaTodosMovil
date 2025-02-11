import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil/config/convertFile.dart';
import 'package:movil/config/theme/color_tema.dart';
import 'package:movil/data/models/categoriaModelo.dart';
import 'package:movil/domain/entities/categoriaEntidad.dart';
import 'package:movil/domain/entities/imagenEntidad.dart';
import 'package:movil/presentation/view/views/categorias/CategoriasView.dart';
import 'package:movil/presentation/view/widgets/bar.dart';
import 'package:movil/presentation/view/widgets/menuLateral.dart';
import 'package:movil/presentation/viewmodels/categoriaViewModel.dart';
import 'package:provider/provider.dart';

class CategoriaFormulario extends StatefulWidget {
  final CategoriaEntidad? categoria;

  CategoriaFormulario({super.key, this.categoria});

  @override
  State<StatefulWidget> createState() {
    return _CategoriaFormularioState();
  }
}

class _CategoriaFormularioState extends State<CategoriaFormulario> {
  late CategoriaViewModel _viewModel;
  CategoriaEntidad? _categoria;
  bool _esEdicion = false;

  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  File? _imagen;

  void clear() {
    _tituloController.clear();
    _descripcionController.clear();
    _imagen = null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel = Provider.of<CategoriaViewModel>(context, listen: false);
    });
    _categoria = widget.categoria;
    if (_categoria != null) {
      _esEdicion = true;
      if (_categoria!.titulo != null)
        _tituloController.text = _categoria!.titulo;
      if (_categoria!.descripcion != null)
        _descripcionController.text = _categoria!.descripcion;
      if (_categoria!.imagen != null) {
        if (_categoria!.imagen!.datos != null) {
          _convertirImagen();
        }
      }
    }
  }

  Future<void> _convertirImagen() async {
    File? imagen = await ConvertFile.uInt8ListToFile(
        _categoria!.imagen!.datos, _categoria!.imagen!.nombre);
    setState(() {
      _imagen = imagen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(
          title:
              '${(_categoria == null) ? "Insertar Categoria" : "Editar " + (_categoria!.titulo)}'),
      drawer: Menulateral(),
      body: contenedorSeguro(context),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      CategoriaEntidad entidad = CategoriaEntidad(
          titulo: _tituloController.text,
          descripcion: _descripcionController.text);

      if (_imagen != null) {
        entidad.imagenFile = _imagen;
      }

      _viewModel.guardarCategoria(entidad, context);

      // Limpiar los campos del formulario
      _tituloController.clear();
      _descripcionController.clear();
      setState(() {
        _imagen = null;
      });
    }
  }

  Widget contenedorSeguro(BuildContext context) {
    return SafeArea(child: contenido());
  }

  Widget contenido() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _inputTitulo(),
                    _inputDescripcion(),
                    _inputImagen(),
                    _acciones()
                  ],
                ))));
  }

  Widget _inputTitulo() {
    return TextFormField(
      controller: _tituloController,
      decoration: InputDecoration(labelText: 'Titulo'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresa titulo de la categoria, por favor';
        }
        return null;
      },
    );
  }

  Widget _inputDescripcion() {
    return TextFormField(
      controller: _descripcionController,
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(label: Text('Descripcion')),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresa titulo de la categoria, por favor';
        }
        return null;
      },
    );
  }

  Widget _inputImagen() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(children: [
        _mostrarImagen(),
        OutlinedButton(
          onPressed: _selectorImagen,
          child:
              Text((_imagen == null) ? 'Seleccionar Imagen' : 'Cambiar imagen'),
        )
      ]),
    );
  }

  Widget _acciones() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _botonSubmit(),
          _botonCancelar(),
        ],
      ),
    );
  }

  Widget _botonSubmit() {
    return Container(
      child: FilledButton(
        onPressed: () {
          _submitForm();
        },
        child: Text('GUARDAR'),
      ),
    );
  }

  Widget _botonCancelar() {
    return Container(
      child: FilledButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.pop(context);
          }
          clear();
        },
        child: Text('CANCELAR'),
        style: FilledButton.styleFrom(backgroundColor: ColorTheme.secondary),
      ),
    );
  }

  Future<void> _selectorImagen() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imagen = File(pickedImage.path);
      });
    }
  }

  Widget _mostrarImagen() {
    if (_imagen == null) {
      return Text('No se ha seleccionado ninguna imagen');
    }

    Image img = Image.file(this._imagen!, fit: BoxFit.cover);

    Container contenedor = Container(
      height: 300,
      child: img,
    );

    Positioned posicion = Positioned(
        top: 8,
        right: 8,
        child: IconButton.filledTonal(
            onPressed: () {
              setState(() {
                _imagen = null;
              });
            },
            icon: Icon(Icons.close)));

    return Stack(
      children: [contenedor, posicion],
    );
  }
}
