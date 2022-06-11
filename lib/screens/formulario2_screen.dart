import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Formulario2Screen extends StatefulWidget {
  const Formulario2Screen({Key? key}) : super(key: key);

  @override
  State<Formulario2Screen> createState() => _Formulario2ScreenState();
}

List<Widget> bodyElements = [];
int num = 0;
var selecCurrency, eleccion, selecCurrency2, eleccion2;

class _Formulario2ScreenState extends State<Formulario2Screen> {
  bool pressed = false;
  void addBodyElement() {
    bodyElements.add(
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Sintomas').snapshots(),
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
                    var snackBar =
                        SnackBar(content: Text('Se seleccionó $currencyValue'));
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(snackBar);
                    setState(() {
                      selecCurrency = currencyValue;
                    });
                  },
                  value: selecCurrency,
                  hint: const Text('Selecciona un sintoma')),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Home')),
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              bodyElements.clear();
              num = 0;
            });
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: bodyElements,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add'),
        onPressed: () {
          num++;
          setState(() {
            addBodyElement();
          });
        },
      ),
    );
  }
}
