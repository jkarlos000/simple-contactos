/**
 * Jkarlos, simple app, para gestionar contactos, utilizando una clase - struct
 * Persona, se emplea una lista compuesta por ella, funcionalidades de agregar
 * eliminar establecidad, no se ha requerido de Modificar contacto.
 */


import 'package:contactos/src/pages/contact_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contactos',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ContactListPage(),  // La primera pagina que mostrara sera la lista de contactos.
      ),
    );
  }
}
