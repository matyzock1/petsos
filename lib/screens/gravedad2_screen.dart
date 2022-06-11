import 'package:flutter/material.dart';

class Gravedad2Screen extends StatefulWidget {
  const Gravedad2Screen({Key? key, required List c}) : super(key: key);

  @override
  State<Gravedad2Screen> createState() => _Gravedad2ScreenState();
}

class _Gravedad2ScreenState extends State<Gravedad2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            IconButton(
                icon: Image.asset('assets/cuation.png'),
                iconSize: 100,
                onPressed: () {}),
            const Text('ESTADO LEVE!!'),
          ],
        ),
      ),
    );
  }
}
