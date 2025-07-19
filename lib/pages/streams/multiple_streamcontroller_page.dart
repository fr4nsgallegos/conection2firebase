import 'dart:async';

import 'package:flutter/material.dart';

class MultipleStreamcontrollerPage extends StatelessWidget {
  StreamController<int> streamController1 = StreamController<int>.broadcast();
  StreamController<int> streamController2 = StreamController<int>.broadcast();
  StreamController<int> streamController3 = StreamController<int>.broadcast();
  int contador1 = 0, contador2 = 0, contador3 = 0;

  void _incrementar1() {
    contador1++;
    streamController1.sink.add(contador1);
  }

  void _incrementar2() {
    contador2++;
    streamController2.sink.add(contador2);
  }

  void _incrementar3() {
    contador3++;
    streamController3.sink.add(contador3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _incrementar1();
              },
              child: Text("Incrementear en contador 1"),
            ),
            StreamBuilder(
              stream: streamController1.stream,
              initialData: contador1,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(child: Text("CONTADOR1: ${snapshot.data}"));
              },
            ),

            StreamBuilder(
              stream: streamController1.stream,
              initialData: contador1,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(child: Text("CONTADOR1: ${snapshot.data}"));
              },
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                _incrementar2();
              },
              child: Text("Incrementar contador 2"),
            ),
            StreamBuilder(
              stream: streamController2.stream,
              builder: (context, snapshot) {
                return Text("Contador2: ${snapshot.data}");
              },
            ),

            StreamBuilder(
              stream: streamController2.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ElevatedButton(
                  onPressed: (snapshot.data ?? 0) > 5
                      ? () => print("ok")
                      : null,
                  child: Text("Aceptar"),
                );
              },
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                _incrementar3();
              },
              child: Text("Incrementar contador 3"),
            ),
            StreamBuilder(
              stream: streamController3.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return LinearProgressIndicator(
                  value: (snapshot.data ?? 0) / 10,
                );
              },
            ),
            StreamBuilder(
              stream: streamController3.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if ((snapshot.data ?? 0) >= 10) {
                  return Text("LISTO!");
                }
                return Text("Progreso: ${snapshot.data}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
