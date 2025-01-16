import 'package:flutter/material.dart';

class CampoBusqueda extends StatelessWidget {
  CampoBusqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return cuadroBusqueda(context);
    /*
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            //controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              // Aquí puedes manejar el texto ingresado
              print('Texto buscado: $value');
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: List.generate(
                10,
                (index) => ListTile(
                  title: Text('Elemento $index'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    */
  }

  Widget cuadroBusqueda(BuildContext context) {
    return Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(hintText: 'buscar...'),
        ));
  }
}
