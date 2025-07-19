import 'package:con2g12/pages/provider.dart/model/animal_provider.dart';
import 'package:con2g12/pages/provider.dart/model/provider3_page.dart';
import 'package:con2g12/pages/provider.dart/model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider2Page extends StatelessWidget {
  const Provider2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("PROVIDER")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //mediante consumer para consumir provider
            Consumer<PerritoProvider>(
              builder: (context, perrito, child) => Text(
                "PERRITO: ${perrito.name}",
                style: TextStyle(fontSize: 35),
              ),
            ),

            Divider(height: 48),
            Text(
              "USUARIO: ${providerUser.name}",
              style: TextStyle(fontSize: 35),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Provider3Page()),
                );
              },
              child: Text("IR A LA SIGUIENTE PANTALLA"),
            ),
          ],
        ),
      ),
    );
  }
}
