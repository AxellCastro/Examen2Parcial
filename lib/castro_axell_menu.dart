import 'package:castro_axell_examen/castro_axell_plato_class.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

class CastroAxellMenu extends StatelessWidget {
  const CastroAxellMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Reserva',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFE97132),
      ),
      body: const DescargaXmlPage(),
    );
  }
}

class DescargaXmlPage extends StatefulWidget {
  const DescargaXmlPage({super.key});

  @override
  State<DescargaXmlPage> createState() => _DescargaXmlPageState();
}

class _DescargaXmlPageState extends State<DescargaXmlPage> {
  Future<List<CastroAxellPlatoClass>> _leerplatos() async {
    final data =
        await DefaultAssetBundle.of(context).loadString('assets/comida.xml');
    final document = xml.XmlDocument.parse(data);
    final elementos = document.findAllElements('comida');

    return elementos.map((elemento) {
      final titulo = elemento.findElements('titulo').single.text;
      final imagen = elemento.findElements('imagen').single.text;
      final precio = double.parse(elemento.findElements('precio').single.text);
      return CastroAxellPlatoClass(
          titulo: titulo, imagen: imagen, precio: precio);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _mostrarXML();
  }

  Widget _mostrarXML() {
    return FutureBuilder(
      future: _leerplatos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final libros = snapshot.data!;
          return ListView.builder(
            itemCount: libros.length,
            itemBuilder: (context, index) {
              final libro = libros[index];
              return Card(
                color: Colors.lightGreen.shade100,
                child: ListTile(
                    leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(libro.imagen)),
                    title: Text(libro.titulo,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Autor: ${libro.titulo}'),
                          Text('Precio: ${libro.precio}')
                        ])),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return const Center(
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
