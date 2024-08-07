import 'package:castro_axell_examen/castro_axell_menu.dart';
import 'package:castro_axell_examen/castro_axell_nuevo.dart';
import 'package:castro_axell_examen/castro_axell_principal.dart';
import 'package:flutter/material.dart';

class CastroAxellHome extends StatefulWidget {
  const CastroAxellHome({super.key});

  @override
  State<CastroAxellHome> createState() => _CastroAxellHomeState();
}

class _CastroAxellHomeState extends State<CastroAxellHome> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(199, 201, 164, 144),
        backgroundColor: const Color.fromARGB(200, 244, 184, 152),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Reserva'),
          NavigationDestination(
              icon: Icon(Icons.person_search_rounded), label: 'Consulta')
        ],
      ),
      body: [
        const CastroAxellPrincipal(),
        const CastroAxellNuevo(),
        const CastroAxellMenu(),
      ][currentPageIndex],
    );
  }
}
