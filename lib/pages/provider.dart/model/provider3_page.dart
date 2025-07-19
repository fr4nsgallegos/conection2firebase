import 'package:con2g12/pages/provider.dart/model/animal_provider.dart';
import 'package:con2g12/pages/provider.dart/model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider3Page extends StatelessWidget {
  const Provider3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final providerPerrito = Provider.of<PerritoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("PROVIDER 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //mediante consumer para consumir provider
            Text("Nombre del perrito: ${providerPerrito.name}"),
            ElevatedButton(
              onPressed: () {
                providerPerrito.name = "LUCAS";
              },
              child: Text("Cambiar nombre a perrito"),
            ),
            Divider(height: 48),
            Text("Nombre del usuario: ${providerUser.name}"),
            ElevatedButton(
              onPressed: () {
                providerUser.name = "JHONNY GALLEGOS";
              },
              child: Text("Cambiar nombre AL USUARIO"),
            ),
          ],
        ),
      ),
    );
  }
}
