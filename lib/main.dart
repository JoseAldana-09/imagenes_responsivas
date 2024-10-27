import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? clave}) : super(key: clave);

  @override
  Widget build(BuildContext contexto) {
    return const MaterialApp(
      home: PantallaGaleria(),
    );
  }
}

class PantallaGaleria extends StatelessWidget {
  const PantallaGaleria({Key? clave}) : super(key: clave);

  @override
  Widget build(BuildContext contexto) {
    final List<String> listaImagenes = [
      'https://cdn.pixabay.com/photo/2023/06/28/12/32/chameleon-8094345_1280.jpg',
      'https://cdn.pixabay.com/photo/2023/11/07/12/49/wolves-8372284_1280.jpg',
      'https://cdn.pixabay.com/photo/2020/06/02/22/56/sea-animals-5252859_1280.jpg',
      'https://cdn.pixabay.com/photo/2020/10/27/07/40/cheetahs-5689873_1280.jpg',
      'https://cdn.pixabay.com/photo/2022/12/12/17/05/elephants-7651446_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/09/05/08/52/watzmann-9024268_1280.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 178, 179),
      appBar: AppBar(
        title: const Text('Galería de Fotos de Jose Aldana',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(
        builder: (contexto, restricciones) {
          // Cambiar la cantidad de columnas según el ancho de la pantalla
          int cantidadColumnas = restricciones.maxWidth < 600 ? 2 : 3;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cantidadColumnas, // Número de columnas
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: listaImagenes.length,
              itemBuilder: (contexto, indice) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: contexto,
                      builder: (BuildContext contexto) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: InteractiveViewer(
                            child: Image.network(
                              listaImagenes[indice],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.network(
                    listaImagenes[indice],
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
