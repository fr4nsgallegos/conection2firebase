import 'dart:async';

import 'package:flutter/material.dart';

class ContadorStreamcontroller extends StatefulWidget {
  @override
  State<ContadorStreamcontroller> createState() =>
      _ContadorStreamcontrollerState();
}

class _ContadorStreamcontrollerState extends State<ContadorStreamcontroller> {
  final StreamController<int> _streamController = StreamController<int>();

  int _contador = 0;

  void incrementar() {
    _contador++;
    _streamController.sink.add(_contador);
  }

  @override
  void dispose() {
    _streamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _streamController.stream,
              initialData: _contador,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  "valor: ${snapshot.data}",
                  style: TextStyle(fontSize: 35),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                incrementar();
              },
              child: Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
