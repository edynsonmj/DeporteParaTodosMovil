import 'package:flutter/material.dart';

class EncabezadoImagen extends StatelessWidget {
  String? rutaImagen;
  EncabezadoImagen({super.key, this.rutaImagen = ''});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Image.network(
      rutaImagen!,
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
            child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
              : null,
        ));
      },
      errorBuilder: (context, error, stackTrace) =>
          Image.asset('assets/images/1.jpg'),
    ));
  }
}
