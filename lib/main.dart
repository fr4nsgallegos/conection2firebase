import 'package:con2g12/firebase_options.dart';
import 'package:con2g12/pages/home_page.dart';
import 'package:con2g12/pages/temporizador_stream_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      home: TemporizadorStreamPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
