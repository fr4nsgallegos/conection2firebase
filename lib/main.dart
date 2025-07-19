import 'package:con2g12/firebase_options.dart';
import 'package:con2g12/pages/google_maps/map_page1.dart';
import 'package:con2g12/pages/google_maps/map_page2.dart';
import 'package:con2g12/pages/home_page.dart';
import 'package:con2g12/pages/provider.dart/model/animal_provider.dart';
import 'package:con2g12/pages/provider.dart/model/counter_model.dart';
import 'package:con2g12/pages/provider.dart/model/provider2_page.dart';
import 'package:con2g12/pages/provider.dart/model/user_provider.dart';
import 'package:con2g12/pages/provider.dart/provider1_page.dart';
import 'package:con2g12/pages/streams/contador_streamcontroller.dart';
import 'package:con2g12/pages/streams/multiple_streamcontroller_page.dart';
import 'package:con2g12/pages/streams/stream_firestore_page.dart';
import 'package:con2g12/pages/streams/stream_text_page.dart';
import 'package:con2g12/pages/streams/temporizador_stream_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(
//     MaterialApp(home: ProviderExample(), debugShowCheckedModeBanner: false),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PerritoProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CounterModel()),
      ],
      child: MaterialApp(
        home: Provider2Page(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PerritoProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CounterModel()),
      ],
      child: Provider2Page(),
    );

    // SOLO CUANDO ES 1 PROVIDER
    // ChangeNotifierProvider(
    //   create: (_) => CounterModel(),
    //   child: Provider1Page(),
    // );
  }
}
