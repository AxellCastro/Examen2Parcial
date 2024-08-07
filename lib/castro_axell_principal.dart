import 'package:flutter/material.dart';

class CastroAxellPrincipal extends StatelessWidget {
  const CastroAxellPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Principal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFE97132),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Color(0xFF156082),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Restaurante XYZ',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      Text('Ubicación: Mapasingue Este',
                          style: TextStyle(color: Colors.white)),
                      Text('Horario de Ateención: 09:00 - 20:00',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset('assets/restaurante.jpg')
          ],
        ),
      ),
    );
  }
}
