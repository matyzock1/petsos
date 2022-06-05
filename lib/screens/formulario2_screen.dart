import 'package:components/screens/utilidades/colores.dart';
import 'package:flutter/material.dart';

class Formulario2Screen extends StatelessWidget {
  const Formulario2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PET-SOS GATO',
            style: TextStyle(color: Colors.black54),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("00d5ff"),
              hexStringToColor("371ed2")
            ]),
          ),
        ));
  }
}
