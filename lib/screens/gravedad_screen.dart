import 'package:flutter/material.dart';

class GravedadScreen extends StatefulWidget {
  const GravedadScreen({Key? key, required List b}) : super(key: key);

  @override
  State<GravedadScreen> createState() => _GravedadScreenState();
}

class _GravedadScreenState extends State<GravedadScreen> {
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
                icon: Image.asset('assets/cuation2.png'),
                iconSize: 100,
                onPressed: () {}),
            const Text('ESTADO GRAVE!!'),
          ],
        ),
      ),
    );
  }
}
