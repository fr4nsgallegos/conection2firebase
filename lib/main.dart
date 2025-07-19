import 'package:con2g12/firebase_options.dart';
import 'package:con2g12/pages/google_maps/map_page1.dart';
import 'package:con2g12/pages/home_page.dart';
import 'package:con2g12/pages/streams/contador_streamcontroller.dart';
import 'package:con2g12/pages/streams/multiple_streamcontroller_page.dart';
import 'package:con2g12/pages/streams/stream_firestore_page.dart';
import 'package:con2g12/pages/streams/stream_text_page.dart';
import 'package:con2g12/pages/streams/temporizador_stream_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: MapPage1(), debugShowCheckedModeBanner: false));
}
