import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con2g12/models/user_model.dart';
import 'package:con2g12/pages/future_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference userReference = FirebaseFirestore.instance.collection(
    "users",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Conexión a firestore"), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  userReference.get().then((value) {
                    List<QueryDocumentSnapshot> docs = value.docs;
                    // docs.forEach((element) {
                    //   print(element.data());
                    // });
                    List<UserModel> users = docs.map((doc) {
                      return UserModel.fromMap(
                        doc.data() as Map<String, dynamic>,
                        doc.id,
                      );
                    }).toList();

                    users.forEach((user) {
                      print(user);
                      print(user.id);
                      print(user.name);
                      print(user.lastname);
                      print(user.isPeruvian);
                      print("*****************************");
                    });
                  });
                },
                child: Text("Get data"),
              ),
              ElevatedButton(
                onPressed: () {
                  userReference
                      .where("age", isGreaterThan: 10)
                      .where("isPeruvian", isEqualTo: true)
                      .get()
                      .then((value) {
                        List<QueryDocumentSnapshot> docs = value.docs;
                        docs.forEach((doc) => print(doc["name"]));
                      });
                },
                child: Text("Get data filtrada"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Agregando directamente un mapa a firestore
                  // userReference
                  //     .add({
                  //       "name": "Luciana",
                  //       "lastname": "Merino",
                  //       "age": 19,
                  //       "isPeruvian": true,
                  //     })
                  //     .then((value) {
                  //       print(value);
                  //       print(value.id);
                  //     });

                  // Agregando desde un modelo a firestore
                  UserModel newUser = UserModel(
                    id: '',
                    name: "Julio",
                    lastname: "Marquez",
                    age: 56,
                    isPeruvian: false,
                  );
                  userReference.add(newUser.toMap()).then((value) {
                    print("Nuevo usuario agregado con el id  ${value.id}");
                  });
                },
                child: Text("Agregar usuario"),
              ),
              ElevatedButton(
                onPressed: () {
                  userReference.doc("user5").set({
                    "name": "Melina",
                    "lastname": "Quiroz",
                    "age": 21,
                    "isPeruvian": true,
                  });
                },
                child: Text("Inserción con id"),
              ),
              ElevatedButton(
                onPressed: () {
                  userReference.doc("user1").update({"age": 36});
                },
                child: Text("Actualización"),
              ),
              ElevatedButton(
                onPressed: () {
                  userReference.doc("user5").delete();
                },
                child: Text("Eliminación"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FutureListPage()),
                  );
                },
                child: Text("Future List"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
