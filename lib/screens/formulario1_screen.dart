import 'package:components/screens/utilidades/colores.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  _FormularioScreenState();

  // ignore: prefer_typing_uninitialized_variables
  var selecCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PET-SOS PERRO',
          style: TextStyle(color: Colors.black54),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Razas').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                List<DropdownMenuItem> currencyItems = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                      ),
                      value: snap.id,
                    ),
                  );
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: currencyItems,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency = currencyValue;
                        });
                      },
                      value: selecCurrency,
                      hint: const Text('Seleccione una raza.')),
                ],
              );
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Peso').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                List<DropdownMenuItem> currencyItems = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                      ),
                      value: snap.id,
                    ),
                  );
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: currencyItems,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency = currencyValue;
                        });
                      },
                      value: selecCurrency,
                      hint: const Text('Seleccione un peso.')),
                ],
              );
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Edad').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                List<DropdownMenuItem> currencyItems = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                      ),
                      value: snap.id,
                    ),
                  );
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: currencyItems,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency = currencyValue;
                        });
                      },
                      value: selecCurrency,
                      hint: const Text('Seleccione una edad.')),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
