import 'dart:async';

import 'package:flutter/material.dart';

class StreamTextPage extends StatefulWidget {
  @override
  State<StreamTextPage> createState() => _StreamTextPageState();
}

class _StreamTextPageState extends State<StreamTextPage> {
  final StreamController<String> _textStreamController =
      StreamController<String>();

  @override
  void dispose() {
    _textStreamController.close(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (text) => _textStreamController.sink.add(text),
            ),
            SizedBox(height: 24),
            StreamBuilder(
              stream: _textStreamController.stream,
              // initialData: initialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text("TEXTO: ${snapshot.data ?? '-'}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
