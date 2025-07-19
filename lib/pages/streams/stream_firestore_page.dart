import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con2g12/main.dart';
import 'package:flutter/material.dart';

class StreamFirestorePage extends StatelessWidget {
  final CollectionReference users = FirebaseFirestore.instance.collection(
    "users",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          users.add({"name": "Juana", "lastname": "Perian", "age": 19});
        },
      ),
      appBar: AppBar(title: Text("Usuarios en tiempo real")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: users.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = docs[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text("${data['name']} ${data["lastname"]}"),
                        subtitle: Text(data["age"].toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                users.doc(docs[index].id).update({
                                  "name": "Editado",
                                  "lastname": "Modificado",
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                users.doc(docs[index].id).delete();
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
