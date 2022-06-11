// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:components/screens/gravedad2_screen.dart';
import 'package:components/screens/screens.dart';
import 'package:flutter/material.dart';

class SintomasScreen extends StatefulWidget {
  final List a;
  const SintomasScreen({Key? key, required this.a}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SintomasScreen> createState() => _SintomasScreenState(a);
}

class _SintomasScreenState extends State<SintomasScreen> {
  List a = [];
  _SintomasScreenState(this.a);

  var selecCurrency,
      selecCurrency2,
      selecCurrency3,
      eleccion,
      eleccion2,
      eleccion3,
      estado,
      estado2,
      estado3;

  bool pressed = false;
  bool isApretado = false;
  bool isApretado2 = false;
  bool isApretado3 = false;

  List estadoGravedad = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PET-SOS SINTOMAS',
            style: TextStyle(color: Colors.black54),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sintomas',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Sintomas').snapshots(),
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
                  eleccion = currencyItems;
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: eleccion,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency = currencyValue;
                          isApretado = true;

                          FirebaseFirestore.instance
                              .collection('Sintomas')
                              .doc(selecCurrency)
                              .get()
                              .then((value) {
                            Map data = value.data() as Map;
                            // print(data[estado]);
                            estado = data['estado'];
                            estadoGravedad.add(estado);
                          });
                        });
                      },
                      value: selecCurrency,
                      hint: const Text('Selecciona un sintoma')),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Sintomas').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                List<DropdownMenuItem> currencyItems2 = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems2.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                      ),
                      value: snap.id,
                    ),
                  );
                  eleccion2 = currencyItems2;
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: eleccion2,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency2 = currencyValue;
                          isApretado2 = true;

                          FirebaseFirestore.instance
                              .collection('Sintomas')
                              .doc(selecCurrency2)
                              .get()
                              .then((value) {
                            Map data = value.data() as Map;
                            // print(data[estado]);
                            estado2 = data['estado'];
                            estadoGravedad.add(estado2);
                          });
                        });
                      },
                      value: selecCurrency2,
                      hint: const Text('Selecciona un sintoma')),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Sintomas').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                List<DropdownMenuItem> currencyItems3 = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems3.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                      ),
                      value: snap.id,
                    ),
                  );
                  eleccion3 = currencyItems3;
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<dynamic>(
                      items: eleccion3,
                      onChanged: (currencyValue) {
                        var snackBar = SnackBar(
                            content: Text('Se seleccionó $currencyValue'));
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selecCurrency3 = currencyValue;
                          isApretado3 = true;

                          FirebaseFirestore.instance
                              .collection('Sintomas')
                              .doc(selecCurrency3)
                              .get()
                              .then((value) {
                            Map data = value.data() as Map;
                            // print(data[estado]);
                            estado3 = data['estado'];
                            estadoGravedad.add(estado3);
                          });
                        });
                      },
                      value: selecCurrency3,
                      hint: const Text('Selecciona un sintoma')),
                ],
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          // pressed
          //     ? StreamBuilder<QuerySnapshot>(
          //         stream: FirebaseFirestore.instance
          //             .collection('Sintomas')
          //             .snapshots(),
          //         builder: (BuildContext context, AsyncSnapshot snapshot) {
          //           if (!snapshot.hasData) {
          //             return const Text('Loading');
          //           } else {
          //             List<DropdownMenuItem> currencyItems = [];
          //             for (int i = 0; i < snapshot.data.docs.length; i++) {
          //               DocumentSnapshot snap = snapshot.data.docs[i];
          //               currencyItems.add(
          //                 DropdownMenuItem(
          //                   child: Text(
          //                     snap.id,
          //                   ),
          //                   value: snap.id,
          //                 ),
          //               );
          //               eleccion2 = currencyItems;
          //             }
          //           }
          //           return Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               DropdownButton<dynamic>(
          //                   items: eleccion,
          //                   onChanged: (currencyValue) {
          //                     var snackBar = SnackBar(
          //                         content:
          //                             Text('Se seleccionó $currencyValue'));
          //                     // ignore: deprecated_member_use
          //                     Scaffold.of(context).showSnackBar(snackBar);
          //                     setState(() {
          //                       selecCurrency2 = currencyValue;
          //                     });
          //                   },
          //                   value: selecCurrency2,
          //                   hint: const Text('Selecciona un sintoma')),
          //             ],
          //           );
          //         },
          //       )
          //     : const SizedBox(),
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   color: Colors.blue,
          //   onPressed: () {
          //     setState(() {
          //       pressed = true;
          //     });
          //   },
          // ),
          if (isApretado && isApretado2 && isApretado3)
            ElevatedButton(
              onPressed: () {
                if (estado == 'grave' &&
                    estado2 == 'grave' &&
                    estado3 == 'grave') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GravedadScreen(b: estadoGravedad)));
                }
                if (estado == 'leve' &&
                    estado2 == 'leve' &&
                    estado3 == 'leve') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Gravedad2Screen(c: estadoGravedad)));
                }
                if (estado == 'grave' &&
                    estado2 == 'leve' &&
                    estado3 == 'leve') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Gravedad2Screen(c: estadoGravedad)));
                }
                if (estado == 'grave' &&
                    estado2 == 'grave' &&
                    estado3 == 'leve') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GravedadScreen(b: estadoGravedad)));
                }
                if (estado == 'grave' &&
                    estado2 == 'leve' &&
                    estado3 == 'grave') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GravedadScreen(b: estadoGravedad)));
                }
                if (estado == 'leve' &&
                    estado2 == 'grave' &&
                    estado3 == 'leve') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Gravedad2Screen(c: estadoGravedad)));
                }
              },
              child: const Text("CONSULTAR ESTADO"),
            )
          else
            ElevatedButton(
                onPressed: () {},
                child: const Text('Faltan'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ))

          // ElevatedButton(
          //   onPressed: () {},
          //   child: const Text("SIGUIENTE"),
          // ),
        ]));
  }
}
