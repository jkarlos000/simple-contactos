import 'package:contactos/src/clases/Persona.dart';
import 'package:flutter/material.dart';

class ContactAddPage extends StatefulWidget {
  List<Persona> contactos;

  ContactAddPage(List<Persona> contactos) {
    this.contactos = contactos;
  }

  @override
  _ContactAddPage createState() => _ContactAddPage(this.contactos);
}

class _ContactAddPage extends State<ContactAddPage>{
  // Se declaran variables para controlar el comportamiento de la aplicacion y obtención de datos.
  // Esta parte del codigo esta mas legible que la otra vista.
  String _nom="", _ape="", _tel="";
  bool _b = true;
  List<Persona> contactos;

  _ContactAddPage(List<Persona> contactos) {
    this.contactos = contactos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Contacto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[  // Se crea una vista de Widgets, siendo estos entradas de datos y un boton de verificación.
          Divider(),
          _nombre(),
          Divider(),
          _apellidos(),
          Divider(),
          _telefono(),
          Divider(),
          _btnAdd(context),
        ],
      ),
    );
  }

  Widget _nombre(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Ingrese su nombre",
        labelText: 'Nombres:',
        icon: Icon(Icons.account_box),
      ),
      onChanged: (valor) => setState(() {
        _nom = valor;
      }),
    );
  }

  Widget _apellidos(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Ingrese sus apellidos",
        labelText: 'Apellidos:',
        icon: Icon(Icons.account_box),
      ),
      onChanged: (valor) => setState(() {
        _ape = valor;
      }),
    );
  }

  Widget _telefono(){
    return TextField(
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: "Ingrese su número de telefono",
        labelText: 'Telefono:',
        icon: Icon(Icons.call),
      ),
      onChanged: (valor) => setState(() {
        _tel = valor;
      }),
    );
  }

  Widget _btnAdd(BuildContext context){
    return Center(
      child: RaisedButton(
        child: Text('Añadir Contacto'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          _registrarPersona(context);

          },
      ),
    );
  }

  void _registrarPersona(BuildContext context){  // Si todo esta bien, muestra un mensaje de agregado, caso contrario, una advertencia.
    if (_nom != "" && _ape != "" && _tel!=""){
      contactos.add(new Persona(nombre: _nom, apellidos: _ape, telefono: _tel));
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: Text('¡Contacto Agregado!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Se ha registrado a '+_nom+' '+_ape+'.')
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: (){

                    Navigator.of(context).pop();
                    Navigator.pop(context);

                  },
                ),
              ],
            );
          }
      );
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: Text('Ha ocurrido un Error'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Revise todos los campos antes de continuar.')
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    }
  }
}