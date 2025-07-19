import 'package:con2g12/pages/provider.dart/model/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider1Page extends StatelessWidget {
  const Provider1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Contador con provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: ${counter.count}", style: TextStyle(fontSize: 35)),

            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().increment();
              },
              child: Text("Incrementar en 1"),
            ),
          ],
        ),
      ),
    );
  }
}
